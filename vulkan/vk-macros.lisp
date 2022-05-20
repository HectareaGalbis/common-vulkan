;; Copyright 2019 Andrew Kenneth Wolven <awolven@gmail.com>
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
;; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
;; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(in-package :cvk)

(defmacro defvkinstextfun ((cname lname) result-type &body args)
  (let ((instance-arg (gensym "INSTANCE")))
    `(defun ,lname (,instance-arg ,@(mapcar 'car args))
       (cffi:foreign-funcall-pointer
        (cffi:with-foreign-string (p-native ,cname)
           (VkGetInstanceProcAddr ,instance-arg p-native))
        nil
        ,@(loop for arg in args
           collect (second arg) collect (first arg))
        ,result-type))))

(defmacro defvkdevextfun ((cname lname) result-type &body args)
  (let ((device-arg (gensym "DEVICE")))
    `(defun ,lname (,device-arg ,@(mapcar 'car args))
       (cffi:foreign-funcall-pointer
        (cffi:with-foreign-string (p-native ,cname)
           (VkGetDeviceProcAddr ,device-arg p-native))
        nil
        ,@(loop for arg in args
           collect (second arg) collect (first arg))
        ,result-type))))


;; Assigns the value 0 to all slots of p
(defun zero-struct (p type &optional (count 1))
  (loop for i from 0 below (* count (cffi:foreign-type-size type))
     do (setf (cffi:mem-aref p :unsigned-char i) 0))
  (values))

;; memset from C standard library (parece ser que puede dar problemas, mejor usar zero-struct)
#|(cffi:defcfun "memset" :pointer
    (str :pointer) (c :int) (n :size))|#


;; Creates an integer representing an vulkan version
(defmacro make-version (major minor patch)
  `(logior (ash ,major 22) (ash ,minor 12) ,patch))


;; Defines a with macro named name, using a constructor and a destructor
;; The constructor can receive zero or more arguments and can return one or more values
;; The destructor must receive 'destructor-arity' arguments. These arguments are the first values the constructor returns
;; The resulting macro binds some vars to the results from the constructor. These vars can be fewer than the returned values
(defmacro defwith (name create destroy &key (destructor-arity 1))
  (with-gensyms ((var "var") (var-list "var-list") (args "args") (ret-list "ret-list") (body "body"))
    `(defmacro ,name (,var ,args &body ,body)
       (with-gensyms ((,ret-list "ret-list"))
         (let ((,var-list (if (listp ,var)
                              ,var
                              (list ,var))))
           `(let ((,,ret-list (multiple-value-list (,',create ,@,args))))
              (unwind-protect
                (multiple-value-bind ,,var-list (values-list ,,ret-list)
                  ,@,body)
                (apply #',',destroy (subseq ,,ret-list 0 ,',destructor-arity)))))))))


;; Allocates an object and initialize all its members to zero.
(defun alloc-vulkan-object (struct-type &optional (count 1))
  (let ((object-ptr (cffi:foreign-alloc struct-type :count count)))
    (zero-struct object-ptr struct-type count)
    (values object-ptr)))

;; Deallocates an object
(defun free-vulkan-object (object-ptr)
  (cffi:foreign-free object-ptr))

;; with-vulkan-object macro
(defwith with-vulkan-object
         alloc-vulkan-object
         free-vulkan-object)


;; Works like a let, but accepts macros whose last expression must be a body or forms* expression.
;; This allows to avoid deep indentation.
(defmacro nest (clauses &body body)
  (first (reduce (lambda (c d) (list (append c d))) clauses :from-end t :initial-value body)))
