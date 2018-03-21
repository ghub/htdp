; Exercise 26.
; What do you expect as the value of this program:
; (define (string-insert s i)
;   (string-append (substring s 0 i)
;                  "_"
;                  (substring s i)))
;
; (string-insert "helloworld" 6)
; Confirm your expectation with DrRacket and its stepper.

#lang racket

(define (string-insert s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))

(string-insert "helloworld" 6)

; "hellow_orld"
