; Exercise 40.
; Formulate the examples as BSL tests, that is, using the check-expect form.
; Introduce a mistake. Re-run the tests.

#lang racket

(require test-engine/racket-tests)

; WorldState -> WorldState
; moves the car by 3 pixels for every clock tick
(define (tock ws)
  (+ ws 3))

(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

(test)
