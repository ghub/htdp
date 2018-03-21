; Exercise 12.
; Define the function cvolume, which accepts the length of a side of an
; equilateral cube and computes its volume. If you have time, consider defining
; csurface, too.

; Hint An equilateral cube is a three-dimensional container bounded by six
; squares. You can determine the surface of a cube if you know that the
; square’s area is its length multiplied by itself. Its volume is the length
; multiplied with the area of one of its squares.  (Why?)

#lang racket

(define (cvolume x)
  (* x x x))

(define (csurface x)
  (* 6 (* x x)))
