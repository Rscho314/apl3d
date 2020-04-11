#lang typed/racket #:with-refinements

(provide lex)

;; TYPES
(define-new-subtype Token (make-token Index))
(define-type LeftParenToken (Refine [c : Token] (= c 40)))
(define-type RightParenToken (Refine [c : Token] (= c 41)))
(define-type DigitToken (Refine [c : Token] (and (>= c 48) (<= c 57))))

(define-type Coordinates
  (List Exact-Nonnegative-Integer
        Exact-Nonnegative-Integer
        Exact-Nonnegative-Integer))

(struct node
  ([glyph    : Token]
   [coord    : Coordinates]
   [parents  : (Listof Coordinates)]
   [children : (Listof Coordinates)]))

(define-type Program
  (Listof node))

;; CONSTANTS
(define origin : Coordinates '(0 0 0))

;; FUNCTIONS
(: token? (-> Any Boolean))
(define (token? code)
  (cond
    [((make-predicate LeftParenToken) code) #t]
    [((make-predicate RightParenToken) code) #t]
    [((make-predicate DigitToken) code) #t]
    [else #f]))

(: lex (-> String (Option (Listof Token))))
(define (lex source)
  (define char-list : (Listof Char) (string->list source))
  (for/list : (Listof Token) ([c char-list])
    (let ([c (char->integer c)])
      (if (token? c)
          (make-token c)
          (error "Tokenization failed: unexpected codepoint")))))
