; Exercise 27.
; Our solution to the sample problem contains several constants in the middle
; of functions. As One Program, Many Definitions already points out, it is best
; to give names to such constants so that future readers understand where these
; numbers come from. Collect all definitions in DrRacket’s definitions area and
; change them so that all magic numbers are refactored into constant
; definitions.

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
