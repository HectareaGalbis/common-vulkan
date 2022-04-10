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
#|(defun zero-struct (p struct-typespec)
    (loop for i from 0 below (cffi:foreign-type-size struct-typespec)
       do (setf (cffi:mem-aref p :unsigned-char i) 0))
    (values))|#

;; memset from C standard library
(cffi:defcfun "memset" :pointer
  (str :pointer) (c :int) (n :size))

;; Wraps a body creating a vulkan object with all of its slots being 0.
(defmacro with-vulkan-object ((p-info struct-type &optional (count 1)) &body body)
  (let ((p-info-sym (gensym)) (struct-type-sym (gensym)))
    `(let ((,p-info-sym ,p-info) (,struct-type-sym ,struct-type))
       (cffi:with-foreign-object (,p-info-sym '(:struct ,struct-type-sym) ,count)
                                 (memset ,p-info-sym 0 (* (cffi:foreign-type-size '(:struct ,struct-type-sym)) ,count))
                                 ,@body))))


;; Creates an integer representing an vulkan version
(defmacro make-version (major minor patch)
  `(logior (ash ,major 22) (ash ,minor 12) ,patch))


;; Checks the result of a vulkan function
;; Taken from https://github.com/zyrolasting/racket-vulkan/blob/master/unsafe.rkt
(defun check-result (result)
  (let ((success-codes '(VK_OPERATION_NOT_DEFERRED_KHR VK_THREAD_DONE_KHR VK_EVENT_SET VK_OPERATION_DEFERRED_KHR VK_SUCCESS VK_INCOMPLETE
                         VK_THREAD_IDLE_KHR VK_PIPELINE_COMPILE_REQUIRED_EXT VK_SUBOPTIMAL_KHR VK_NOT_READY VK_TIMEOUT VK_EVENT_RESET)))
    (unless (if (typep result 'symbol) (member result success-codes) (>= result 0)) (error "check-result failed: ~S" result))))


;; Defines a with macro named name, using a constructor and a destructor
;; The constructor can receive zero or more arguments and can return one or more values
;; The destructor must receive only one argument. This argument is the first value the constructor returns
(defmacro defwith (name create destroy)
  (let ((var-args (gensym "var-args"))
        (var-sym  (gensym "var"))
        (args-sym (gensym "args")))
    `(defmacro ,name (,var-args &body body)
      (let ((,var-sym    (if (listp (first ,var-args))
                             (first ,var-args)
                             (list (first ,var-args))))
            (,args-sym   (rest ,var-args))
            (create-sym  ',create)
            (destroy-sym ',destroy))
        `(multiple-value-bind ,,var-sym (,create-sym ,@,args-sym)
          (unwind-protect
            (progn ,@body)
            (,destroy-sym ,(first ,var-sym))))))))


;; Works like a let, but accepts macros whose last expression must be a body or forms* expression.
;; This allows to avoid deep indentation.
(defmacro nest (clauses &body body)
  (first (reduce (lambda (c d) (list (append c d))) clauses :from-end t :initial-value body)))
