module Lowcode  where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Data.List

singleton :: forall a. a -> List a
singleton a = a : Nil

sing :: String
sing = "XRP"

null :: forall a. List a -> Boolean
null Nil = true
null _ = false

nul :: List String
nul = Nil

snoc :: forall a. List a -> a -> List a
snoc list add = reverse (add : reverse list)

snc :: List String
snc = "Hello" : "," : "world" : Nil

addEl :: String
addEl = "!"

length :: forall argument. List argument -> Int
length Nil = 0
length (Cons _ list) = 1 + length list

leng :: List String
leng = "Hello" : "," : "world" : Nil

test :: Effect Unit
test = do
    log ("First Task" <> show (singleton sing))
    log ("Second Task " <> show (null nul))
    log ("Third Task" <> show (snoc snc addEl))
    log ("Fourth Task " <> show (length leng))