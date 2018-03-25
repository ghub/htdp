; Exercise 44.
; Formulate the examples as BSL tests. Click RUN and watch them fail.

#lang racket

(require test-engine/racket-tests)

; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down"
(define (hyper x-position-of-car x-mouse y-mouse me)
  x-position-of-car)

(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move") 42)

(test)
