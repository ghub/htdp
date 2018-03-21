; Exercise 16.
; Define the function image-area, which counts the number of pixels in a given
; image. See exercise 6 for ideas.

#lang racket

(require 2htdp/image)

(define (image-area image)
  (* (image-width image) (image-height image)))
