; Exercise 13.
; Define the function string-first, which extracts the first 1String from a
; non-empty string.

#lang racket

(define (non-empty? str)
  (> (string-length str) 0))

(define (first-letter str)
  (substring str 0 1))

(define (string-first str)
  (if (non-empty? str) (first-letter str) ""))
