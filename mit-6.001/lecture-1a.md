# Lecture 1A from MIT 6.001 (1986)

## Techniques for Controlling Complexity

- Black-Box Abstraction
- Conventional Interfaces
- Metalinguistic Abstraction
  - Iterpretation (apply-eval)
  - Example logic programming
  - Register machines


## Part 2

3 is a symbol that represents the idea of 3.

This is called a combination:

```scheme
(+ 3 12.4 5)
```

which is applying an operator (`+`) to some operands (`3 12.4 5`). The operands can also be combinations (e.g., `(+ 3 (* 5 6) 8 2)`).

It creates a tree:

![tree](../assets/fig-1.1.2.png)

The combination is a way to write the tree structure as a linear character string.

The string `(+ 3 (* 5 6) 8 2)` represents [this tree](http://www.plantuml.com/plantuml/uml/SoWkIImgoStCIybDBE3IKdZKi8XBIqj16qGO0mc8093M0fEcOD8C96418eou75BpKg3Q0G00):

![tree](../assets/lecture-1a-combination-tree.png)

## `define`

```scheme
(define x 10)
(+ x 1)
;=> 11
```

## Procedures

Instead of `(* 2 2)` and `(* 10 10)`, you define abstractions of those procedures. `lambda` makes a procedure.

```scheme
; no parens around `square`
(define square (lambda (x) (* x x)))
```

Syntactic sugar (note the parens around the symbol):

```scheme
; parens around square
(define (square x) (* x x))
```

More examples from the video:

```scheme
(define (average x y)
  (/ (+ x y) 2))

(define (mean-square x y)
  (average (square x)
           (square y)))
```

Your procedures get used with all the power and flexibility as primitives.

## Conditionals

```scheme
(define (abs x)
  ; predicates and actions
  (cond ((< x 0) (- x))
        ((= x 0) 0)
        ((> x 0) x)))
```

Or use `if` for one condition:

```scheme
(define (abs x)
  (if (< x 0)
      (- x)
      x))
```

## Square Root Algorithm

To find an approximation to $ \sqrt{x} $:

- make a guess G
- improve the guess by averaging G and X/G
- keep improving the guess until it is good enough
- use 1 as an initial guess

```scheme
(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x))
     .001))

(define (try guess x)
  (if (good-enough? guess x)
      guess
      (try (improve guess x) x)))

(define (sqrt x) (try 1 x))
```

The [tree](http://www.plantuml.com/plantuml/uml/BSn12WKX2CRnlQTeBRmplAxYa3GjoiOicDkFH2lbpuyl3YErMbggr073UDG0CPY-W7wpIFfnavdllmSlT8tzE9sal5MfNMNn0OkLCaFabixm1m00):

(Note that `try` also references itself, but I'm not sure how to add an arrow in plantuml.)

![square root procedure tree](../assets/lecture-1a-tree-square-algorithm.png)
