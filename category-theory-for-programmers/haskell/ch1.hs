module Ch1 where

identity :: a -> a
identity a = a

compose :: (a -> b) -> (b -> c) -> (a -> c)
compose f1 f2 = (\a -> f2 f1 a)

idOnA :: (a -> b) -> (a -> b)
idOnA f = (\data -> f identity data)

idOnB :: (a -> b) -> (a -> b)
idOnB f = (\data -> identity f data)
