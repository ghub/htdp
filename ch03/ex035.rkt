; Exercise 35.
; Design the function string-last, which extracts the last character from a
; non-empty string.

#lang racket

; String -> String
; Extract the last character from a non-empty string.
; given: "z", expect "z"
; given: "xyz", expect "z"
(define (string-last s)
  (substring s (sub1 (string-length s))))

(string-last "z")
(string-last "xyz")
