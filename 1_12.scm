;; 原文只翻译了 *它采用递归计算过程计算出帕斯卡三角形。* ，应该是 *帕斯卡三角形的各个元素* 。

(define (pascal row col)
  (cond ((< row col) (error "row < col"))
         ((or (= col 0) (= row col)) 1)
         (else (+ (pascal (- row 1) col)
                  (pascal (- row 1) (- col 1))))))

;; 利用阶乘迭代求帕斯卡三角形

(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))

(define (pascal-better row col)
  (/ (factorial row)
     (* (factorial col)
        (factorial (- row col)))))

;; [[Pascal's triangle][https://en.wikipedia.org/wiki/Pascal%27s_triangle]]
