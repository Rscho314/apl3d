#lang racket/base

#|TODO:
   - start parser in lang.rkt
   - make tokens structs, to allow glyph storage & help with error messages
|#

(module+ test
  (require rackunit))

(module+ test)

#;(module+ reader
  (require "reader.rkt")
  (provide read-syntax))

(module+ main
  (require racket/cmdline
           "lang.rkt")
  (command-line
    #:program "apl3d-interpreter"
    #:args (src)
    (printf "~a~n" (lex src))))
