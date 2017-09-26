; Exercise 9.
; Add the following line to the definitions area of DrRacket:
; (define in ...)

; Then create an expression that converts the value of in to a positive number.
; For a String, it determines how long the String is;
; for an Image, it uses the area;
; for a Number, it decrements the number by 1, unless it is already 0 or negative;
; for #true it uses 10 and for #false 20.

#lang racket

(require 2htdp/image)

(define in "abc")
;(define in (square 10 "solid" "red"))
;(define in 123)
;(define in -123)
;(define in #true)
;(define in #false)

(if (string? in) (string-length in)
  (if (image? in) (* (image-width in) (image-height in))
    (if (number? in) (if (> in 0) (- in 1) in)
      (if (boolean? in) (if in 10 20)
        0))))
