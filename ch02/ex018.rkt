; Exercise 18.
; Define the function string-join, which consumes two strings and appends them
; with "_" in between. See exercise 2 for ideas.

#lang racket

(define (string-join prefix suffix)
  (string-append prefix "_" suffix))
