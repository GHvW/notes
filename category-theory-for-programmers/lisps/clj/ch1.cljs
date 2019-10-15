(defn identity [a] a)

(defn compose [f1 f2]
    (fn [data] (f2 (f1 data))))

(println (identity 10))

(println (identity "Hello World!"))