module ASTInterpreter where

import Ast
import StatefulUnsafeMonad


data State -- TODO change to be the type of state, you have freedom for how you implement it





eval :: Program -> [String]
eval p = undefined
-- eval p = getPrints $ snd $ app (eval' p) undefined
--
-- getPrints :: State -> [String]
-- getPrints = undefined
--
-- eval' :: Program -> StatefulUnsafe State Int
-- eval' = undefined
