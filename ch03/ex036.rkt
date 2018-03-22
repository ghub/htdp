; Exercise 36.
; Design the function image-area, which counts the number of pixels in a given
; image.

#lang racket

(require 2htdp/image)

; Image -> Number
; Counts the number of pixels in a given image.
; given: rectangle 3x2, expect 6
(define (image-area img)
  (* (image-width img) (image-height img)))

(image-area (rectangle 3 2 "solid" "red"))
