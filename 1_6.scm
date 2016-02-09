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

;; 解析器提示： =Aborting!: maximum recursion depth exceeded=

;; 使用 =(trace sqrt-iter)= 跟踪 =sqrt-iter= 函数，再试调用 =(sqrt 9)=， 得到以下结果

;; +BEGIN_SRC sh
;; [Entering #[compound-procedure 14 sqrt-iter]
;;           Args: 3.
;;           9]
;; [Entering #[compound-procedure 14 sqrt-iter]
;;           Args: 3.
;;           9]
;; [Entering #[compound-procedure 14 sqrt-iter]
;;           Args: 3.
;;           9]
;; [Entering #[compound-procedure 14 sqrt-iter]
;;           Args: 3.
;;           9]
;; [Entering #[compound-procedure 14 sqrt-iter]
;;           Args: 3.
;;           9]
;; [Entering ^Z
;; [1]+  Stopped                 scheme
;; +END_SRC

;; 从P12 得知， =if= 只是 Scheme 中的一种特殊形式，而 自定义的 =new-if= 准确的来说是一个过程

;; 从前面习题和书中信息得知， Mit-Scheme 属于 *应用序求值* , 即“先求值参数而后应用”， 而 =sqrt-iter= 在 =new-if= 未做判断的时候不断自身调用，且参数不变

;; 即在使用 =new-if= 时，无论predicate 是否为真，是否为假， =new-if= 也不断的对 =then-clause= 和 =else-clause= 进行求值

;; 因为整个程序中 =guess= 和 =x= 一直没变，因此 =sqrt-iter=不断自身调用，并且参数不变
