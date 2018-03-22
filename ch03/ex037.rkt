; Exercise 37.
; Design the function string-rest, which produces a string like the given one
; with the first character removed.

#lang racket

; String -> String
; Produces a string like the givin one with the first character remvoed.
; given: "abc", expect "bc"
; given: "a", expect ""
(define (string-rest s)
  (substring s 1))

(string-rest "abc")
(string-rest "a")
