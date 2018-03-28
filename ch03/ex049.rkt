; Exercise 49.
; A cond expression is really just an expression and may therefore show up in
; the middle of another expression:

; (- 200 (cond [(> y 200) 0] [else y]))

; Use the stepper to evaluate the expression for y as 100 and 210.

#lang racket

(define (f y)
  (- 200 (cond [(> y 200) 0] [else y])))

(f 100)
(f 200)
