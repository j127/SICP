; $ mit-scheme --quiet < script.scm
; (display  (+ 2 2))

; (define result (+ (* 3
;       (+ (* 2 4)
;          (+ 3 5)))
;    (+ (- 10 7)
;       6)))

(define result (+ 2 2))

(define p
  (lambda (val)
    (display val)
    (display "\n")))

(p result)
