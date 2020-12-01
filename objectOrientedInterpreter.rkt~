;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname objectOrientedInterpreter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;global-env is a list of scopes where a scope is a list of name/value pairs (2-lists)
(define apply-env
  (lambda (env name)
    (cond
      ((null? env) #f)
      ((eq? (car (car env)) name) (cadr (car env)))
      (else (apply-env (cdr env) name)))))

;extractors
(define class->super
  (lambda (class)
    (cadr class)))

(define class->env
  (lambda (class)
    (car (caddr class))))


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
    (class '(no-parent) '() '() '(getValue) (list (lambda (self var-name)
                                                    (letrec ((checkParent (lambda (theParent var-name)
                                                                            (let ((answer (apply-env (class->env theParent) var-name))
                                                                                  (parent (class->super theParent)))
                                                                              (cond
                                                                                ((not (eq? answer #f)) answer)
                                                                                ((and
                                                                                   (eq? answer #f)
                                                                                   (not (eq? parent '(no-parent))))
                                                                                 (checkParent parent var-name))
                                                                                (else #f))))))
                                                      (checkParent self var-name)))))))
                                                          
                                                    
(define sendMessageMapper
  (lambda (class-instance list-of-params)
    (cond
      ((null? list-of-params) '())
      (else (cons (sendMessageHelper class-instance (car list-of-params))
                  (sendMessageMapper class-instance (cdr list-of-params)))))))

(define sendMessageHelper
  (lambda (class-instance message)
    (let* ((env (class->env class-instance))
           (answer (apply-env env message))
           (parent (class->super class-instance))) 
      (cond
        ((not (eq? answer #f)) answer)
        ((and
          (eq? answer #f)
          (not (eq? parent '(no-parent)))) (sendMessageHelper parent message))
        (else (display "Message not found!!"))))))
    
(define sendMessage
  (lambda (class-instance message list-of-parameters)
    ((sendMessageHelper class-instance message) class-instance (car list-of-parameters))))
      
(define Person
  (lambda (list-of-field-names list-of-values)
    (class (empty-object) list-of-field-names list-of-values '() '())))

(define p1 (Person '(fname lname age) '(Mike Litman 21)))
(define p2 (Person '(fname lname age) '(Dave Smith 18)))
(sendMessage p2 'getValue '(lname))




