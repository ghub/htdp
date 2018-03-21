; Exercise 29.
; After studying the costs of a show, the owner discovered several ways of
; lowering the cost. As a result of these improvements, there is no longer a
; fixed cost; a variable cost of $1.50 per attendee remains.

; Modify both programs to reflect this change. When the programs are modified,
; test them again with ticket prices of $3, $4, and $5 and compare the results.

#lang racket

(define REFERENCE-PRICE 5.0)
(define REFERENCE-ATTENDEE 120)
(define PRICE-CHANGE 0.1)
(define ATTENDEE-CHANGE 15)
(define VARIABLE-COST-PER-ATTENDEE 1.5)

(define (attendees ticket-price)
  (- REFERENCE-ATTENDEE (* (- ticket-price REFERENCE-PRICE) (/ ATTENDEE-CHANGE PRICE-CHANGE))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (* VARIABLE-COST-PER-ATTENDEE (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 3)
(profit 4)
(profit 5)
