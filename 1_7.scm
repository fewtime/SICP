(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enought? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enought? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; Test
;; (sqrt 9) ;; 3.00009155413138
;; (sqrt (+ 100 37)) ;; 11.704699917758145
;; (sqrt (+ (sqrt 2) (sqrt 3))) ;; 1.773827902307892
;; (square (sqrt 1000)) ;; 1000.000369924366

;; 以下结果为用较小值和较大值调用 =sqrt= 的结果：

;; #+BEGIN_SRC sh
;; ;;较小值：
;; 1 ]=> (sqrt 0.000009) ;; 正确答案： 0.003
;; ;Value: .0081927550495982
;; 1 ]=> (sqrt 4000000000000000000000000000000000000000000000000000000000000) ;; 正确答案: 2 * 10^30
;; ;; 死循环
;; #+END_SRC

;; 按照书上的提示，即
;; #+BEGIN_QUOTE
;; 监视猜测值在从一次迭代到下一次的变化情况，当改变值相对于猜测值的比率很小时就结束。
;; +END_QUOTE

;; 把 =good-enought?= 和 =sqrt-iter= 进行如下修改：

;; #+BEGIN_SRC scheme

(define (good-enought? old-guess new-guess)
  (> 0.0001
     (/ (abs (- new-guess old-guess))
     old-guess)))

(define (sqrt-iter guess x)
  (if (good-enought? guess (improve guess x))
      (improve guess x)
      (sqrt-iter (improve guess x)
                 x)))

;; #+END_SRC

;; 再次调用，如下:
;; #+BEGIN_SRC sh
;; 1 ]=> (sqrt 0.000009) ;; 正确答案: 0.003
;; ;Value: 3.0000000001273205e-3
;; 1 ]=> (sqrt 4000000000000000000000000000000000000000000000000000000000000) ;; 正确答案: 2 * 10^30
;; ;Value: 2.0000000062161492e30
;; #+END_SRC

;; 与标准答案相近
