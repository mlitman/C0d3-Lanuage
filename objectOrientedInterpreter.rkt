;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname objectOrientedInterpreter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;global-env is a list of scopes where a scope is a list of name/value pairs (2-lists)

;constructors

(define class
  (lambda (base-class list-of-field-names list-of-field-values list-of-method-names list-of-method-values)
    (letrec ((create-pairs-for-scope (lambda (lon lov)
                             (cond
                               ((null? lon) '())
                               (else (cons (list (car lon)
                                                 (car lov))
                                           (create-pairs-for-scope (cdr lon) (cdr lov)))))))
             (global-env (list (create-pairs-for-scope (append list-of-field-names list-of-method-names)
                                                       (append list-of-field-values list-of-method-values)))))
      (list 'class base-class global-env))))

(define empty-object
  (lambda ()
    (class '(no-parent) '() '() '(getValue) (list (lambda (var-name) 'need-logic-here-PARTOFHW)))))

(define sendMessage ;HW HERE TOO

(define Person
  (lambda (list-of-field-names list-of-values)
    (class (empty-object) list-of-field-names list-of-values '() '())))

(define p1 (Person '(fname lname age) '(Mike Litman 21)))
(define p2 (Person '(fname lname age) '(Dave Smith 18)))
(send-message p1 getValue '(fname))
p2


  



;extractors
(define class->super
  (lambda (class)
    (cadr class)))

(define class->list-of-fields
  (lambda (class)
    (caddr class)))




