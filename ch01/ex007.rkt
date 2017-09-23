; Exercise 7.
; Boolean expressions can express some everyday problems.
; Suppose you want to decide whether today is an appropriate day to go to the mall.
; You go to the mall either if it is not sunny or if today is Friday (because that is when stores post new sales items).

; Here is how you could go about it using your new knowledge about Booleans.
; First add these two lines to the definitions area of DrRacket:
; (define sunny #true)
; (define friday #false)
; Now create an expression that computes whether sunny is false or friday is true.
; So in this particular case, the answer is #false. (Why?)

#lang racket

(define sunny #true)
(define friday #false)

(or (not sunny) friday)
