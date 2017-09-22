; Exercise 6.
; Add the following line to the definitions area:
; (define cat ...)
; Create an expression that counts the number of pixels in the image.

#lang racket

(require 2htdp/image)

(define (find-one-of file1 file2)
    (if (file-exists? file1)
        file1
        file2))

(define cat (bitmap/file (find-one-of "icons/cat1.png" "../icons/cat1.png")))
(* (image-width cat) (image-height cat))
