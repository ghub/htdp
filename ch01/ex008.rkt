; Exercise 8.
; Add the following line to the definitions area:
; (define cat ...)

; Create a conditional expression that computes whether the image is tall or wide.
; An image should be labeled "tall" if its height is larger than or equal to its width; otherwise it is "wide".
; See exercise 1 for how to create such expressions in DrRacket; as you experiment,
; replace the cat with a rectangle of your choice to ensure that you know the expected answer.

#lang racket

(require 2htdp/image)

(define (find-one-of file1 file2)
    (if (file-exists? file1)
        file1
        file2))

(define cat (bitmap/file (find-one-of "icons/cat1.png" "../icons/cat1.png")))
(if (<= (image-width cat) (image-height cat)) "tall" "wide")
