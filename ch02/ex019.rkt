; Exercise 19.
; Define the function string-insert, which consumes a string str plus a number
; i and inserts "_" at the ith position of str. Assume i is a number between 0
; and the length of the given string (inclusive). See exercise 3 for ideas.
; Ponder how string-insert copes with "".

#lang racket

(define (string-insert str i)
  (string-append (substring str 0 i) "_" (substring str i)))
