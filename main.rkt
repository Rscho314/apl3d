#lang racket

(module+ test
  (require rackunit
           "lang.rkt"))

(module+ test
   (check-true (program? (list (list #'≥ >= '((0 0 0)) '((0 0 1)))))))

(module+ main
  (require racket/cmdline
           "lang.rkt")
  (command-line
    #:program "apl3d-interpreter"
    #:args (src)
    (call-with-input-string src read)))