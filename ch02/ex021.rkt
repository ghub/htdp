; Exercise 21.
; Use DrRacket’s stepper to evaluate (ff (ff 1)) step-by-step.
; Also try (+ (ff 1) (ff 1)). Does DrRacket’s stepper reuse the results of computations?

#lang racket

(define (ff a)
  (* 10 a))

(ff (ff 1))

(+ (ff 1) (ff 1))
