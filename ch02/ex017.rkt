; Exercise 17.
; Define the function image-classify, which consumes an image and conditionally
; produces "tall" if the image is taller than wide, "wide" if it is wider than
; tall, or "square" if its width and height are the same. See exercise 8 for
; ideas.

#lang racket

(require 2htdp/image)

(define (image-classify image)
  (if (<= (image-width image) (image-height image)) "tall" "wide"))
