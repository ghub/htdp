; Exercise 28.
; Determine the potential profit for these ticket prices: $1, $2, $3, $4, and
; $5. Which price maximizes the profit of the movie theater? Determine the best
; ticket price to a dime.

#lang racket

(define REFERENCE-PRICE 5.0)
(define REFERENCE-ATTENDEE 120)
(define PRICE-CHANGE 0.1)
(define ATTENDEE-CHANGE 15)
(define FIXED-COST 180)
(define VARIABLE-COST-PER-ATTENDEE 0.04)

(define (attendees ticket-price)
  (- REFERENCE-ATTENDEE (* (- ticket-price REFERENCE-PRICE) (/ ATTENDEE-CHANGE PRICE-CHANGE))))

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
