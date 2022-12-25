module Main where

import Prelude

import Data.List (List(..), (:), reverse)
import Data.Maybe (Maybe(Just, Nothing))
import Data.Tuple (Tuple(..),fst,snd)

import Effect.Console (log)

import Effect (Effect)

findIndex :: forall a. (a -> Boolean) -> List a -> Maybe Int
findIndex pred list = findElement 0 pred list 
  where

  findElement :: Int -> (a -> Boolean) -> List a -> Maybe Int
  findElement num pred (elem : lis) | pred elem = Just num
                | otherwise = findElement (num + 1) pred lis
  findElement _ _ Nil = Nothing


findLastIndex :: forall a. (a -> Boolean) -> List a -> Maybe Int
findLastIndex pred list = findElement 0 pred list Nothing
  where

  findElement :: Int -> (a -> Boolean) -> List a -> Maybe Int -> Maybe Int
  findElement num pred (elem : lis)  sec_elem | pred elem = findElement (num + 1) pred lis (Just num) 
                | otherwise = findElement (num + 1) pred lis sec_elem 
  findElement _ _ Nil sec_elem = sec_elem

zip :: forall a b. List a -> List b -> List (Tuple a b)
zip (elem : lis) (sec_elem : sec_lis) = Cons (Tuple elem sec_elem) (zip lis sec_lis)
zip _ _ = Nil

unzip :: forall a b. List (Tuple a b) -> Tuple (List a) (List b)
unzip zip_res = Tuple (res_list zip_res) (sec_res_list zip_res)
  where

  res_list :: List (Tuple a b) -> List a
  res_list (elem : lis) = Cons (fst elem) (res_list lis)
  res_list Nil = Nil

  sec_res_list :: List (Tuple a b) -> List b
  sec_res_list (elem : lis) = Cons (snd elem) (sec_res_list lis)
  sec_res_list Nil = Nil

filter :: forall a. (a -> Boolean) -> List a -> List a
filter pred (elem : lis) 
    | pred elem = Cons elem (filter pred lis)
    | otherwise = filter pred lis
filter _ Nil = Nil

tailFilter :: forall a. (a -> Boolean) -> List a -> List a -> List a
tailFilter pred (elem : lis) res 
    | pred elem = tailFilter pred lis (elem : res) 
    | otherwise = tailFilter pred lis res
tailFilter _ _ res = reverse res

take :: forall a. Int -> List a -> List a
take num (elem : lis) 
    | num == 0 = Nil
    | otherwise = Cons elem (take (num-1) lis)
take _ _ = Nil

tailTake :: forall a. Int -> List a -> List a -> List a
tailTake num (elem : lis) res
    | num == 0 = reverse res
    | otherwise = tailTake (num-1) lis ( elem : res )
tailTake _ _ res = reverse res
  


main :: Effect Unit
main = do
    log ("First Task " <> show (findIndex (\elem -> elem > 2) (1:2:3:4:8:10:12:Nil)))
    log ("Second Task " <> show (findLastIndex (\elem -> elem > 2) (1:2:3:4:8:10:12:Nil)))
    log ("Third Task " <> show (zip (1:2:3:Nil) (4:5:6:Nil)))
    log ("Fourth Task " <> show (unzip (zip (1:2:3:Nil) (4:5:6:Nil))))
    log ("Fiveth Task " <> show (filter (\elem -> elem > 2) (1:2:3:4:8:10:12:Nil)))
    log ("Sixth Task " <> show (tailFilter (\elem -> elem > 2) (1:2:3:4:8:10:12:Nil) Nil))
    log ("Seventh Task " <> show (take 2 (1:2:5:10:Nil)))
    log ("Eighth Task " <> show (tailTake 2 (1:2:5:10:Nil) Nil))
