module ProofScratch where


-- further reading -  http://people.inf.elte.hu/divip/AgdaTutorial/Index.html

-- to typecheck file: C-c C-l
-- to view type: C-c C-d

data Nat : Set where
  zero : Nat
  succ : Nat -> Nat


three : Nat 
three = succ (succ(succ(zero)))

-- we can aslo define

one : Nat 
one = succ zero

two : Nat 
two = succ one


four : Nat 
four = succ three

five : Nat 
five = succ four

-- we can write functions like in haskel

-- to get in hole: C-c C-,
-- to pattern match: C-c C-c
-- "refine" a hole: C-c C-r
_+_ : Nat -> Nat -> Nat
-- l + r = ?
zero + r = r
succ l + r = succ (l + r)

-- to run function: C-c C-n
ans = two + three

data GTE  : Nat ->  Nat -> Set where
 eqItself : (n : Nat) -> GTE n n
 greaterThanByOne : (a : Nat) -> (b : Nat) -> GTE a b -> GTE (succ a) b

proof : GTE three (succ zero)
-- proof = ?  -- C-c C-a or C-c C-r
proof = greaterThanByOne (succ (succ zero)) (succ zero)
          (greaterThanByOne (succ zero) (succ zero) (eqItself (succ zero)))

proofAllNatsGTEZero : (n : Nat) -> GTE n zero
--proofAllNatsGTEZero n =?
proofAllNatsGTEZero zero = eqItself zero
proofAllNatsGTEZero (succ n) = greaterThanByOne n zero (proofAllNatsGTEZero n)


gteSucc : (n : Nat) -> (m : Nat) ->  GTE n m -> GTE (succ n) (succ m)
gteSucc n .n (eqItself .n) = eqItself (succ n)
gteSucc .(succ a) m (greaterThanByOne a .m pr) = greaterThanByOne (succ a) (succ m) (gteSucc a m pr)


transitive : (a : Nat) -> (b : Nat) -> (c : Nat) -> (GTE a b) -> (GTE b c) -> (GTE a c)
-- transitive a b c ab bc
transitive a .a c (eqItself .a) bc = bc
transitive .(succ a) b .b (greaterThanByOne a .b ab) (eqItself .b) = greaterThanByOne a b ab
transitive .(succ a₁) .(succ a) c (greaterThanByOne a₁ .(succ a) ab) (greaterThanByOne a .c bc) = greaterThanByOne a₁ c
                                                                                                    (transitive a₁ (succ a) c ab (greaterThanByOne a c bc))


-- bigger example

data List A : Set where
  Nil : List A
  Cons : (a : A) -> List A -> List A


data Bool : Set where
  True : Bool
  False : Bool

if : {c : Set} -> Bool -> c -> c -> c
if True then else = then
if False then else = else

isGTE : Nat -> Nat -> Bool
isGTE m zero = True
isGTE zero (succ n) = False
isGTE (succ m) (succ n) = isGTE m n


data _×_ (A B : Set) : Set where
  <_,_> : A -> B -> A × B

fst : {A B : Set} -> A × B -> A
fst < x , y > = x

snd : {A B : Set} -> A × B -> B
snd < x , y > = y


-- a dumb sorting algorithm whos correctness is easy to prove

min : Nat -> Nat -> Nat × Nat
min zero m = < zero , m >
min n zero = < zero , n >
min (succ n) (succ m) with min n m
min (succ n) (succ m) | < s , b > = < succ s , succ b >

insert : Nat -> List Nat -> List Nat
insert n Nil = (Cons n Nil)
insert n (Cons a ls) with min n a
insert n (Cons a ls) | < s , b > = (Cons s (insert b  ls))
-- = if (isGTE a n) (Cons n (Cons a ls)) (Cons a (insert n ls)) 

-- the sort part of insertion sort

sort : List Nat -> List Nat
sort Nil = Nil
sort (Cons a ls) = insert a (sort ls)

sortTest = sort (Cons three (Cons one (Cons five Nil))) 



data lBound (n : Nat)  : List Nat -> Set where
  emptyGood : lBound n Nil
  hasThings : (m : Nat) -> (rest : List Nat)  -> GTE m n -> lBound  n rest -> lBound n (Cons m rest)



data Sorted : (List Nat) -> Set where
  isEmpty : Sorted Nil
  notEmpty : (m : Nat) -> (rest : List Nat)  -> (Sorted rest) -> lBound m rest -> Sorted (Cons m rest)

-- sortWorks :  (ls : List Nat)  -> Sorted (sort ls)
-- sortWorks = {!!} -- this is posible to prove like this https://gist.github.com/aztek/92e6d47bde0d128bcb9d


data Σ (A : Set) (B : A → Set) : Set where
  _,_ : (a : A) → (b : B a) → Σ A B



data Either (A : Set)  (B : Set) : Set where
  Left : A -> Either A B
  Right : B -> Either A B


isGTE' : (n : Nat) ->  (m : Nat) ->  Either (GTE n m) (GTE m n)
isGTE' zero m = Right (proofAllNatsGTEZero m)
isGTE' n zero =  Left (proofAllNatsGTEZero n)
isGTE'  (succ n) (succ m) with isGTE' n m
isGTE' (succ n) (succ m) | Left x = Left (gteSucc n m x)
isGTE' (succ n) (succ m) | Right x = Right (gteSucc m n x)

lbLem : (x : Nat) -> (y : Nat) ->  (ls : List Nat) -> GTE y x -> lBound y ls -> lBound x ls
-- lbLem x y ls y>=x y<=ls = {!!}
lbLem x y Nil y>=x y<=ls = emptyGood
lbLem x y (Cons a ls) y>=x (hasThings .a .ls x₁ y<=ls) = hasThings a ls (transitive a y x x₁ y>=x) (lbLem x y ls y>=x y<=ls)

lbLem2 : (x : Nat) -> (y : Nat) ->  (ls : List Nat) -> lBound x (Cons y ls) -> GTE y x
-- lbLem2 x y ls bound = {!!}
lbLem2 x y ls (hasThings .y .ls x₁ bound) = x₁

lbLem3 : (x : Nat) -> (y : Nat) ->  (ls : List Nat) -> GTE y x -> lBound y ls -> lBound x (Cons y ls)
-- lbLem3 x y ls y>=x y<=ls = {!!}
lbLem3 x y .Nil y>=x emptyGood = hasThings y Nil y>=x emptyGood
lbLem3 x y .(Cons m rest) y>=x (hasThings m rest x₁ y<=ls) = hasThings y (Cons m rest) y>=x (hasThings m rest (transitive m y x x₁ y>=x) (lbLem x y rest y>=x y<=ls))

insert' : (n : Nat) -> (ls : List Nat) -> Sorted ls ->  Σ ( List Nat) (\ ls' -> (Sorted ls')  × ( (x : Nat) -> GTE n x -> lBound x ls -> lBound x ls'))
insert' n Nil pr = (Cons n Nil) , < (notEmpty n Nil pr emptyGood) , (λ x → hasThings n Nil) >
insert' n (Cons m ls) pr with isGTE' n m
insert' n (Cons m ls) (notEmpty .m .ls pr bound) | Right m>=n = (Cons n ((Cons m ls))) , < notEmpty n (Cons m ls) (notEmpty m ls pr bound) (lbLem3 n m ls m>=n bound) , (λ x n>=x x<=mls → hasThings n (Cons m ls) n>=x x<=mls) >
insert' n (Cons m ls) (notEmpty .m .ls pr x) | Left n>=m with insert' n ls pr
insert' n (Cons m ls) (notEmpty .m .ls pr bound) | Left n>=m | (ls' , < ls'sorted , f >) = Cons m ls' , < notEmpty m ls' ls'sorted (f m n>=m bound) ,
              (λ x n>=x x<=mls -> let  m<=ls' = f m n>=m bound
                                                  in let  m>=x = lbLem2 x m ls x<=mls
                                                      in hasThings m ls' m>=x (lbLem x m ls' m>=x ( m<=ls')) ) >


sort' :  (ls : List Nat) ->  Σ ( List Nat) (\ ls' -> (Sorted ls') )
sort' Nil = Nil , isEmpty
sort' (Cons n  ls) with sort' ls
sort' (Cons n _) | ls , proof with insert' n ls  proof
sort' (Cons n ls₁) | ls , proof₁ | (ls' , < ls'pr , x₁ >) = ls' , ls'pr

