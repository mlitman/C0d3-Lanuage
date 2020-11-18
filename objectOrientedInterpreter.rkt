;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname objectOrientedInterpreter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;constructors
(define empty-object
  (lambda ()
    (list 'empty-object)))

(define class
  (lambda (base-class list-of-fields list-of-values list-of-methods)
    (letrec ((create-pairs-for-scope (lambda (lon lov)
                             (cond
                               ((null? lon) '())
                               (else (cons (list (car lon)
                                                 (car lov))
                                           (create-pairs-for-scope (cdr lon) (cdr lov)))))))
             (global-env (list (create-pairs-for-scope list-of-fields
                                                       list-of-values))))
      (list 'class base-class global-env list-of-methods))))



(define Person
  (lambda (list-of-field-names list-of-values)
    (class (empty-object) list-of-field-names list-of-values '())))

(define p1 (Person '(fname lname age) '(Mike Litman 21)))
(define p2 (Person '(fname lname age) '(Dave Smith 18)))
p1
p2


  



;extractors
(define class->super
  (lambda (class)
    (cadr class)))

(define class->list-of-fields
  (lambda (class)
    (caddr class)))




