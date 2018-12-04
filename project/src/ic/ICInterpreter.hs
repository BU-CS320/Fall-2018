module ICInterpreter where

import GHC.Generics (Generic)
import Data.Typeable (Typeable)

-- Intermediate Code Interpreter for CS 320 Project
-- See Lecture 24 for details. Code examples
-- given at the bottom of this file.

import Prelude hiding (print)
import qualified Prelude   (print)

import qualified Data.Map as Map

import Debug.Trace

import StatefulUnsafeMonad


-- An IC program is a list of IC instructions
-- Op codes have been given a prime so that
-- you can use some of these again in your
-- AST for the source language

type IC_Program = [IC_Instruction]

data Op = Var' String | Val' Int

data IC_Instruction
        = Plus'  Op Op Op
        | Minus' Op Op Op
        | Times' Op Op Op
        | Div'   Op Op Op
        | Mod'   Op Op Op
        | Equal' Op Op Op
        | NotEq' Op Op Op
        | Lt'    Op Op Op
        | Gt'    Op Op Op
        | Le'    Op Op Op
        | Ge'    Op Op Op
        | And'   Op Op Op        
        | Or'    Op Op Op
        | Uminus' Op Op
        | Not'    Op Op
        | Assign' Op Op
        | Bzero'  Op Int
        | Jump'   Int
        | Call'   Int
        | Push'
        | Return'  Op
        | Print'  String Op
        | Halt'

instance Show Op where
  show (Var' x) = x
  show (Val' v) = show v

instance Show IC_Instruction where
  show (Plus' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " + " ++ (show src2)
  show (Minus' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " - " ++ (show src2)
  show (Times' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " * " ++ (show src2)
  show (Div' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " / " ++ (show src2)
  show (Mod' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " % " ++ (show src2)
  show (Uminus' dest src1) = (show dest) ++ " = - " ++ (show src1)
  show (Equal' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " == " ++ (show src2)
  show (NotEq' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " != " ++ (show src2)
  show (Lt' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " < " ++ (show src2)
  show (Gt' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " > " ++ (show src2)
  show (Le' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " <= " ++ (show src2)
  show (Ge' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " >= " ++ (show src2)
  show (And' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " && " ++ (show src2)
  show (Or' dest src1 src2) = (show dest) ++ " = " ++ (show src1) ++ " || " ++ (show src2)
  show (Not' dest src1) = (show dest) ++ " = ! " ++ (show src1)
  show (Assign' dest src) = (show dest) ++ " = " ++ (show src)
  show (Bzero' src addr) = "bzero " ++ (show src) ++ " " ++ (show addr)
  show (Jump' addr) = "jump " ++ (show addr)
  show (Push') = "push"
  show (Call' addr) = "call " ++ (show addr)
  show (Return' addr) = "return " ++ (show addr)
  show (Print' str src) = "print " ++ "\"" ++ str ++ "\" " ++ (show src)
  show (Halt') = "halt"


showICProgram :: IC_Program -> IO ()
showICProgram p = (showProgram' p 0)
                where
                   showProgram' [] _        = putStr "\n"
                   showProgram' (i:is) addr = do putStrLn $ (show addr) ++ ": " ++ (show i)
                                                 showProgram' is (addr+1)





type Env = Map.Map String Int

type State = ([Env], [String]) -- stackFrames and print lists

pushFrame :: StatefulUnsafe State ()
pushFrame = do (frames, prints) <- get
               put (Map.empty :frames, prints)


popFrame :: StatefulUnsafe State ()
popFrame = do (frames, prints) <- get
              case frames of [] ->  err $ "poped empty stack"
                             _:t -> put (t, prints)

getVal' :: String -> [Env] -> Maybe Int
getVal' _ []  = Nothing
getVal' s (e:frames)  = case Map.lookup s e of Just a -> Just a
                                               Nothing -> getVal' s frames

getVal :: Op -> StatefulUnsafe State Int
getVal (Val' v) = return v
getVal (Var' x) = do (frames, _) <- get
                     case getVal' x frames of Nothing -> err $ "var "++ x ++" not found"
                                              Just a -> return a


--                       case Map.lookup x e of
--                        Nothing -> err $ "var "++ x ++" not found"
--                        Just r -> return r
--
--
putVal' :: String -> Int -> StatefulUnsafe State ()
putVal' s i = do (frames, prints) <- get
                 case frames of [] -> err $ "can't insert into empty stack"
                                h:t -> put (Map.insert s i h : t, prints)

putVal :: Op -> Int -> StatefulUnsafe State ()
putVal (Var' v) i = putVal' v i
putVal _ i = err $ "cannot put into a Var"

print :: String -> StatefulUnsafe State ()
print s = StatefulUnsafe $ \ (e,pr) ->  (Ok (), (e, pr ++ [s] ) )




-- implicitly updates the state, returns the next command and debug info
executeStep :: IC_Instruction -> Int -> StatefulUnsafe State (Int,String)
executeStep  (Print' n src1) i =  do u <- getVal src1
                                     print $ n ++ show u
                                     return (i+1, "ran print command")
executeStep  (Jump' jump) i = return (jump, "jumped to "++ show jump)
executeStep (Bzero' s jump) i = do  num <- getVal s
                                    if num == 0
                                    then return (jump, "Bzeroed to "++ show jump)
                                    else return (i+1, "Skipped Bzero")
executeStep  Halt' i =  return (-1, "halted!")
executeStep (Call' addr) i = do putVal' "_ret_addr" (i+1)
                                return (addr, "called function")
executeStep (Return' src) _ = do retVal <- getVal src
                                 jump <- getVal (Var' "_ret_addr")
                                 popFrame
                                 putVal' "_ret_val" retVal
                                 return (jump, "called function")
executeStep (Push')  i =  do pushFrame
                             return (i+1, "...")

-- easier commands
executeStep (Plus' dest src1 src2)  i             = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (u+v)
                                                       return (i+1, "added")
executeStep (Minus' dest src1 src2) i             = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (u-v)
                                                       return (i+1, "...")
executeStep (Times'  dest src1 src2) i            = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (u*v)
                                                       return (i+1, "...")
executeStep (Div' dest src1 src2) i               = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (div u v)
                                                       return (i+1, "...")
executeStep (Mod'  dest src1 src2) i              = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (mod u v)
                                                       return (i+1, "...")
executeStep (Uminus' dest src1) i                 = do u <- getVal src1
                                                       putVal dest (0-u)
                                                       return (i+1, "...")
executeStep (Assign' dest src1) i                 = do u <- getVal src1
                                                       putVal dest u
                                                       return (i+1, "...")
executeStep (Equal'  dest src1 src2) i            = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (fromEnum(u==v))
                                                       return (i+1, "...")
executeStep (NotEq' dest src1 src2) i             = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (fromEnum(u/=v))
                                                       return (i+1, "...")
executeStep (Lt'  dest src1 src2) i               = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (fromEnum(u<v))
                                                       return (i+1, "...")
executeStep (Gt' dest src1 src2) i                = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (fromEnum(u>v))
                                                       return (i+1, "...")
executeStep (Le'  dest src1 src2) i               = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (fromEnum(u<=v))
                                                       return (i+1, "...")
executeStep (Ge' dest src1 src2) i                = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (fromEnum(u>=v))
                                                       return (i+1, "...")
executeStep (And' dest src1 src2) i               = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (fromEnum(u+v>1))
                                                       return (i+1, "...")
executeStep (Or' dest src1 src2) i                = do u <- getVal src1
                                                       v <- getVal src2
                                                       putVal dest (fromEnum(u+v>0))
                                                       return (i+1, "...")
executeStep (Not' dest src1) i                    = do u <- getVal src1
                                                       putVal dest (fromEnum(u==0))
                                                       return (i+1, "...")


execute [] = (Ok (), [])
execute ls = case app (execute' ls 0) ([Map.empty],[]) of (result, (_, prints)) -> (result, prints)

execute' :: [IC_Instruction] -> Int -> StatefulUnsafe State ()
execute' ls i | i<0 = return ()
execute' ls i | i>= length ls = err "opcode too big"
execute' ls i = do (i, _) <- executeStep (ls !! i) i
                   execute' ls i


--TODO: it would be nice to make this nicely tabulated, https://stackoverflow.com/questions/5929377/format-list-output-in-haskell
-- execute [] = (Ok (), [])
debug timeout ls = case app (debug' timeout ls 0 []) ([Map.empty],[]) of
                    (Error s , (_, prints)) -> do Prelude.print s
                                                  return prints
                    (Ok s , (_, prints)) -> do mapM_ putStrLn  s
                                               return prints

debug' :: Int -> [IC_Instruction] -> Int -> [String] -> StatefulUnsafe State [String]
debug' timout ls i log | timout<0 = return $ log ++ ["timed out"]
debug' timout ls i log | i<0 = return log
debug' timout ls i log = do (i', info) <- executeStep (ls !! i) i
                            (e, _) <- get
                            debug' (timout - 1) ls i' ( log ++ [((show i) ++ ": " ++ (show (ls !! i))++"\t" ++ (show e))++"\t" ++ info])