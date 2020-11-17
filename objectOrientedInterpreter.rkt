;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname objectOrientedInterpreter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;constructors
(define empty-object
  (lambda ()
    (list 'empty-object)))

(define class
  (lambda (base-class list-of-fields list-of-constructors list-of-methods)
    (list 'class base-class list-of-fields list-of-constructors list-of-methods)))

(define Person
  (class empty-object '(firstName lastName age) '() '()))

;define mike to-be a person...how could I do it?
;define dave to-be another instance of person...how could I do it?

  



;extractors
(define class->super
  (lambda (class)
    (cadr class)))

(define class->list-of-fields
  (lambda (class)
    (caddr class)))




