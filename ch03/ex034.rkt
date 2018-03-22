; Exercise 34.
; Design the function string-first, which extracts the first character from a
; non-empty string. Don’t worry about empty strings.

#lang racket

; String -> String
; Extract the first character from a non-empty string.
; given: "a", expect "a"
; given: "ab", expect "a"
(define (string-first s)
  (substring s 0 1))

(string-first "a")
(string-first "ab")
