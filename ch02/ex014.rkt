; Exercise 14.
; Define the function string-last, which extracts the last 1String from a
; non-empty string.

#lang racket

(define (non-empty? str)
  (> (string-length str) 0))

(define (last-letter-index str)
  (sub1 (string-length str)))

(define (last-letter str)
  (substring str (last-letter-index str)))

(define (string-last str)
  (if (non-empty? str) (last-letter str) ""))
