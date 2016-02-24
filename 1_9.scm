(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

(define (plus1 a b)
  (if (= a 0)
      b
      (inc (plus1 (dec a) b))))

;; (+ 4 5)
;; (+ 1 (+ 3 5))
;; (+ 1 (+ 1 (+ 2 5)))
;; (+ 1 (+ 1 (+ 1 (+ 1 5))))
;; (+ 1 (+ 1 (+ 1 (+ 1 (+ 0 5)))))
;; (+ 1 (+ 1 (+ 1 (+ 1 5))))
;; (+ 1 (+ 1 (+ 1 6)))
;; (+ 1 (+ 1 7))
;; (+ 1 8)
;; 9
;; => 递归

(define (plus2 a b)
  (if (= a 0)
      b
      (plus2 (dec a) (inc b))))

;; (+ 4 5)
;; (+ 3 6)
;; (+ 2 7)
;; (+ 1 8)
;; (+ 0 9)
;; 9
;; => 迭代

;; trace 调试
(trace plus1)
(trace plus2)

;; #+BEGIN_SRC sh

;; 1 ]=> (plus1 4 5)

;; [Entering #[compound-procedure 13 plus1]
;;           Args: 4
;;           5]
;; [Entering #[compound-procedure 13 plus1]
;;           Args: 3
;;           5]
;; [Entering #[compound-procedure 13 plus1]
;;           Args: 2
;;           5]
;; [Entering #[compound-procedure 13 plus1]
;;           Args: 1
;;           5]
;; [Entering #[compound-procedure 13 plus1]
;;           Args: 0
;;           5]
;; [5
;;  <== #[compound-procedure 13 plus1]
;;  Args: 0
;;  5]
;; [6
;;  <== #[compound-procedure 13 plus1]
;;  Args: 1
;;  5]
;; [7
;;  <== #[compound-procedure 13 plus1]
;;  Args: 2
;;  5]
;; [8
;;  <== #[compound-procedure 13 plus1]
;;  Args: 3
;;  5]
;; [9
;;  <== #[compound-procedure 13 plus1]
;;  Args: 4
;;  5]
;; ;Value: 9

;; #+END_SRC
;; 递归

;; #+BEGIN_SRC sh
;; 1 ]=> (plus2 4 5)

;; [Entering #[compound-procedure 14 plus2]
;;           Args: 4
;;           5]
;; [Entering #[compound-procedure 14 plus2]
;;           Args: 3
;;           6]
;; [Entering #[compound-procedure 14 plus2]
;;           Args: 2
;;           7]
;; [Entering #[compound-procedure 14 plus2]
;;           Args: 1
;;           8]
;; [Entering #[compound-procedure 14 plus2]
;;           Args: 0
;;           9]
;; [9
;;  <== #[compound-procedure 14 plus2]
;;  Args: 0
;;  9]
;; [9
;;  <== #[compound-procedure 14 plus2]
;;  Args: 1
;;  8]
;; [9
;;  <== #[compound-procedure 14 plus2]
;;  Args: 2
;;  7]
;; [9
;;  <== #[compound-procedure 14 plus2]
;;  Args: 3
;;  6]
;; [9
;;  <== #[compound-procedure 14 plus2]
;;  Args: 4
;;  5]
;; ;Value: 9
;; #+END_SRC
;; 迭代
