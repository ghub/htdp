; Exercise 25.
; Take a look at this attempt to solve exercise 17:
;  (define (image-classify img)
;    (cond
;      [(>= (image-height img) (image-width img)) "tall"]
;      [(= (image-height img) (image-width img)) "square"]
;      [(<= (image-height img) (image-width img)) "wide"]))
; Does stepping through an application suggest a fix?

#lang racket

(require 2htdp/image)

(define (image-classify img)
  (cond
    [(> (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(< (image-height img) (image-width img)) "wide"]))
