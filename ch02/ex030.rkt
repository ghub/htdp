; Exercise 30.
; Define constants for the price optimization program at the movie theater so
; that the price sensitivity of attendance (15 people for every 10 cents)
; becomes a computed constant.

#lang racket

(define REFERENCE-PRICE 5.0)
(define REFERENCE-ATTENDEE 120)
(define PRICE-CHANGE 0.1)
(define ATTENDEE-CHANGE 15)
(define FIXED-COST 180)
(define VARIABLE-COST-PER-ATTENDEE 0.04)
(define PRICE-SENSITIVITY-OF-ATTENDANCE (/ ATTENDEE-CHANGE PRICE-CHANGE))

(define (attendees ticket-price)
  (- REFERENCE-ATTENDEE (* (- ticket-price REFERENCE-PRICE) PRICE-SENSITIVITY-OF-ATTENDANCE)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED-COST (* VARIABLE-COST-PER-ATTENDEE (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 1)
(profit 2)
(profit 3)
(profit 4)
(profit 5)

(profit 2.9)
