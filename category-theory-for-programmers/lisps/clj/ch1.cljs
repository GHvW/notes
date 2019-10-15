(defn identity [a] a)

(defn compose [f1 f2]
    (fn [data] (f2 (f1 data))))

(defn idOnA [f]
    (fn [data] (f (identity a))))

(defn idOnB [f]
    (fn [data] (identity (f a))))

(println (identity 10))

(println (identity "Hello World!"))