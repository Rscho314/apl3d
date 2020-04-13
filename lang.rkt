#lang typed/racket #:with-refinements

(provide program?)

;; TYPES
(define-type Cell-Coordinates
  (List Exact-Nonnegative-Integer
        Exact-Nonnegative-Integer
        Exact-Nonnegative-Integer))

(define-type Origin (Refine [o : Cell-Coordinates] (: o (List Zero Zero Zero))))
(define-type Cell-Face Identifier)
(define-type Cell-Value Any)
(define-type Cell-Inputs (Listof Cell-Coordinates))
(define-type Cell-Outputs (Listof Cell-Coordinates))
(define-type Cell ;; will require additional type constraints
  (List Cell-Face ;; re-use racket identifier rules
        Cell-Value
        Cell-Inputs
        Cell-Outputs))

(define-type Program
  (Listof Cell))

;; CONSTANTS

;; FUNCTIONS
(define program? (make-predicate Program))