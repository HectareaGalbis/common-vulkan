**PFN_vkAllocationFunction**
```lisp
(def-allocation-function-callback ()
 &body body) => nil
```
Define a callback function.

* **Note**: This callback definer needs to be revised. Please, post an issue to request it.

**PFN_vkReallocationFunction**
```lisp
(def-reallocation-function-callback ()
 &body body) => nil
```
Define a callback function.

* **Note**: This callback definer needs to be revised. Please, post an issue to request it.

**PFN_vkFreeFunction**
```lisp
(def-free-function-callback ()
 &body body) => nil
```
Define a callback function.

* **Note**: This callback definer needs to be revised. Please, post an issue to request it.

**PFN_vkInternalAllocationNotification**
```lisp
(def-internal-allocation-notification-callback ()
 &body body) => nil
```
Define a callback function.

* **Note**: This callback definer needs to be revised. Please, post an issue to request it.

**PFN_vkInternalFreeNotification**
```lisp
(def-internal-free-notification-callback ()
 &body body) => nil
```
Define a callback function.

* **Note**: This callback definer needs to be revised. Please, post an issue to request it.

**PFN_vkDebugReportCallbackEXT**
```lisp
(def-debug-report-callback-ext-callback ()
 &body body) => nil
```
Define a callback function.

* **Note**: This callback definer needs to be revised. Please, post an issue to request it.

**PFN_vkDebugUtilsMessengerCallbackEXT**
```lisp
(def-debug-utils-messenger-callback-ext-callback (messageSeverity messageTypes pCallbackData pUserData)
 &body body) => result
```
Define a callback function.

* *Parameters:*
  * *messageSeverity*: `VkDebugUtilsMessageSeverityFlagBitsEXT`
  * *messageTypes*: `vkdebugutilsmessagetypeflagsext`
  * *pCallbackData*: `VkDebugUtilsMessengerCallbackDataEXT`
  * *pUserData*: `lisp object`

* *Return:*
  * *result*: `boolean`

**PFN_vkDeviceMemoryReportCallbackEXT**
```lisp
(def-device-memory-report-callback-ext-callback ()
 &body body) => nil
```
Define a callback function.

* **Note**: This callback definer needs to be revised. Please, post an issue to request it.

