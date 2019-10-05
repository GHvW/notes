module PigsCantFly where

isPalindrome :: (Eq a)  => [a] -> Bool
isPalindrome input = 
  if reverse input == input then
    True
  else
    False


myAbs :: Integer -> Integer
myAbs n = if n < 0 then (-n) else n


f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f ab cd = ((snd ab, snd cd), (fst ab, fst cd))