; Exercise 38.
; Design the function string-remove-last, which produces a string like the
; given one with the last character removed.

#lang racket

; String -> String
; Produces a string like the given on with the last character removed.
; given: "abc", expect "ab"
; given: "a", expect ""
(define (string-remove-last s)
  (substring s 0 (sub1 (string-length s))))

(string-remove-last "abc")
(string-remove-last "a")
