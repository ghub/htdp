; Exercise 5.
; Use the 2htdp/image library to create the image of a simple boat or tree.
; Make sure you can easily change the scale of the entire image.

#lang racket

(require 2htdp/image)

(define MODE "solid")
(define COLOR "red")
(define WIDTH 100)
(define BODY_HEIGHT (* WIDTH 2))

(define HEAD (triangle WIDTH MODE COLOR))
(define BODY (rectangle WIDTH BODY_HEIGHT MODE COLOR))
(above HEAD BODY)
