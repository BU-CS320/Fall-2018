
                           CS 320 FINAL PROJECT
                            Fall 2018

link: https://classroom.github.com/g/QrSvmvWd

Overview:

     Your last assignment for the semester will be a compiler. The source language is a small subset of C,
called Mini-C, and the target language is an Intermediate Code which will be executed by a simple
IC interpreter provided to you. Details of the source language and the target language will be provided
in this document. You will also write an interpreter for the ASTs produced by your parser. This
will the final example of recursive language evaluators pursued through the homeworks, and will also
provide a test of your compiler. 

In this document you will be given a description of the source language, the target language, and some
requirements. In general you will have a lot of flexibility in your implementation, and any reasonable,
correct solution will receive full credit.

Administrative Details

     The project is due Friday, 12/14/18, by midnight in github. Code templates (with types for the major
components), tests, and source code for the IC interpreter will be provided shortly.
     You may write this project by yourself, a parter, or a team of three people. No teams of more than
three will be allowed. All deliverables should be submitted by one member of the team, and have the
names of all team members specified. All will receive equal credit for the work.
     The project will be graded on a scale of 100, scaled to 5% of your final grade, allocated as follows:

  10%  Parser (CParser.hs) -- This will take a String representing a Mini-C program and produce an
          AST expression for the program.  You must also implement a prettyShow function in Ast.hs whos output must always parse.

  10%  Interpreter (ASTInterpreter.hs) -- This will take an AST expression output by the parser, evaluate it,
          and return a list of Strings (produced by print statements in the program).


  60%  Compiler (CCompiler.hs)  -- This will take an AST expression and convert it into an Intermediate Code
          program (a list of IC statements). This IC program can then be executed by the IC interpreter provided
	  to generate output from the print statements in the program. 

  20%  Additional features (FeaturesTests.hs))  -- For the final 20% of the grade, you must implement at
          least two refinements to the project. Some possibilities for this are as follows, but you may
	  consult with us about your own ideas. Each of these is worth 10%, so you can do any two (no
	  extra credit if you do more, though we'll be impressed and I'll be sure to mention it if
	  you ask me for a recommendation down the road!). 

          o   Code optimizer -- Use a stack-based allocation scheme for temporaries to reuse them
	          intelligently, and eliminate redundant jumps.

          o   Add additional language features to Mini-C: comments, for loop, do-while loop. 

          o   Modify the grammar (and hence the entire project) to allow any number of arguments
	          to a function and allow procedures (functions that do not return arguments).

          o   Add a list data type and built in functions (cons, nill, head, tail, indexing) to manipulate lists.
	        Type errors (e.g., trying to add a list and an int) can be ignored (just let the program crash!)

          o   Add floats to the language and write a simple static type checker which will flag errors before
	        execution. Or you could do this for lists (combining with the previous item).

          o   Add nested function definitions to the language (functions defined inside other functions).

       Provide a file FeaturesTests.hs with tests that prove your additional features work as required. We may
       test your code on our own tests as well.

       Make sure that your implementation works on the basic tests, as well as any additional features tests
       you may write. If you want to add required type declarations this would be a problem, so talk to us
       before you go down this road. 


      Please talk to us if you have any other ideas. There are many possibilities!

Submit a file CS320Project.txt along with all your code files which gives the names of the team members
and specifies which of the additional features you have implemented. Also give us any other
information you feel we should know. We will test your code on the test cases provided and
also write some of our own tests. Testing your code with your own tests is part of the project!


Some Advice on How to Proceed

Start by dividing up the work among your team members. There are several
linked phases:


      Parser  -> AST  ->  AST Interpreter ----------------------------------------------> Output (list of Strings)
                  |                                                                       ^
		  |---->  Compiler  ---> IC Program -------->  IC Interpreter (provided) -|
		                               |                ^
			                       | --> Optimizer -|
					       

The first task is to decide on the AST which can represent the source language; this
should be fairly easy, since we have been doing this kind of thing all semester.
One thing you should think about is whether you want to have an explicit
"separator" to create lists of statements, or whether you just want to
have Haskell lists of statements. In lecture I tended to write ASTs on
the board using the former, but you may find (as I did) that using
explicit lists is easier: for for example, in my AST I had programs defined
as:

type Program = [Func]                 -- a program is a list of function definitions                      

and then later I had:

data Stmt =  Block [Stmt]
          |  etc.


Once you have decided on the AST, then you can break the basic work into separate
pieces. Some of the additional features can not be separated out (e.g., reworking
the grammar), so maybe you want to put them in the plan from the beginning.

The parser, the AST Interpreter, and the optimizer are the least amount of work,
and the compiler is probably as much work as all these combined, so plan accordingly.
Some parts of the compiler are busywork, since after you have figured out how to,
say compile one kind of expression, the rest are exactly the same and you end up
cutting and pasting.

You can begin to test your implementations using the examples below and
in the ICInterpreter.hs file (e.g., optimization). Additional
test cases may be provided, but we will also use our own test cases, so
testing and making sure everything works as it should is part of the project!

One nice way to check your work is to verify that the AST interpreter and
the IC Interpreter (after compilation) produce the same results.



The Source Language: Mini-C

The grammar for the source language has been provided in the lecture slides for lecture 24, but here it is
again for your convenience (there have been some changes made relative to what was actually presented in
the lecture, but the PDF of the lecture slides has been updated -- mostly I changed the language so
that only function definitions may be given at the top level, and there is no global memory). 

0: Program := Funcs
1: Funcs := Func Funcs
2: Funcs := Func 
3: Func := def identifier (  ) { Stmts } 
4: Func := def identifier ( identifier ) { Stmts } 
5: Stmts := Stmt ; Stmts 
6: Stmts := Stmt ; 
7: Stmts := Block Stmts 
8: Stmts := Block 
9:  Block := { Stmts } 
10: Block := while ( BExpr ) Block 
11: Block := if ( BExpr ) Block
12: Block := if ( BExpr ) Block else Block 
13: Stmt := id = Expr
14: Stmt := return Expr
15: Stmt := print identifier
16: Stmt := break 
17: Stmt := continue
18: BExpr := BTerm || BExpr
19: BExpr := BTerm
20: BTerm := BFactor && BTerm
21: BTerm := BFactor
22: BFactor := ! Bfactor
23: BFactor := Cond
24: Bfactor := ( Bexpr )
25: Cond := Expr == Expr
26: Cond := Expr != Expr
27: Cond := Expr < Expr
28: Cond := Expr <= Expr
29: Cond := Expr > Expr
30: Cond := Expr >= Expr
31: Expr := Expr + Term 
32: Expr := Expr - Term 
33: Expr := Term  
34: Term := Term * Factor 
35: Term := Term / Factor 
36: Term := Term % Factor 
37: Term := Factor 
38: Factor := - Factor 
39: Factor := identifier ( ) 
40: Factor := identifier ( Expr ) 
41: Factor := identifier 
42: Factor := integer 
43: Factor := ( Expr )



Here are some examples of the Mini-C language. Translations of these
are provided as examples in the file ICInterpreter.hs, with the same numbers. 
Some of these may be provided as test cases in github. 


-----------------------------------------------------------------
Test 1: Just a simple example of expression evaluation

def main() {
   x = 6; 
   y = 8;
   z = x * y / 3 + -x + 2 * y; 
   w = z - x % (x - 2);
   print w;
   return 0; 
}

------------------------------------------------------------------
Test 2:  Conditionals

def main() {
    x = 4;
    y = 2;
    z = -1;
    if(x > 2) {
        print x;
    }
    if(y < 2) {
        print y;
    }
    if(z != 2) {
        print z;
    } else {
        print y;
    }
    print(z);
    if(z <= y) {
        print  x;
        if(x + y > z) {
            print y;
        }
        else {
            print z;
        }
    } else {
        print z; 
    }
    return 0; 
}



------------------------------------------------------------------
Test 3: While loops -- sum the numbers from 1 to 10

def main() {
   k = 1;
   sum = 0;

   while ( k <= 10 ) {
      sum = sum + k;
      k = k + 1;
   }

   print sum;
   return 0; 
}


------------------------------------------------------------------
# Test 4: nested while loops -- for (n,m) with 1 <= n <= 3 and 1 <= m <= 4,
# count for how many pairs n evenly divides m.

def main() {
   n = 1;

   count = 0;

   while ( n <= 3 ) {
      m = 1;
      while ( m <= 4 ) {
         if ( m % n == 0 ) {
            count = count + 1;
         }
         m = m + 1;
      }
      n = n + 1;
   }

   print count;
   return 0; 

}


------------------------------------------------------------------
Test 5: Nested While and If statements: output the first 10 primes

def main() {
   count = 0;
   limit = 10;
   n = 2;   

   while (count <= limit) { 
      isPrime = 1;
      k = 2;
      while ( k < n ) {
         if (n % k == 0) {
            isPrime = 0;
         }
         k = k + 1;
      }
      if (isPrime==1) {
         print n;
         count = count + 1;
      }
      n = n + 1;
   }
   return 0;
}



------------------------------------------------------------------
Test 6:  Basic Boolean expressions -- short-circuit evaluation

def main() {

    x = 3;
    y = 5;
    z = 1;
    
    if( x > 2 && y < 5) {
        print x;
    }
    
    if( x > 2 || y < 5) {
        print x;
    }
    
    if( x > 2 && y < 5 || !(z == 2)) {
        print x;
    }    

    if(z != 2 || x > 2 && y < 5) {
        print x;
    }
    return 0; 
}


------------------------------------------------------------------
Test 7: Basic function call

def f(x) {
    n = x + 1;
    n = n * 2;
    return n;
}

def main() {
    y = 2;
    n = 3;
    z = f(y+n);
    print z;
    return 0; 
}

------------------------------------------------------------------
Test 8: multiple function calls 


def succ(x) {
    return x + 1;
}

def main() {
    a = 1; 
    z = succ(a) + succ(a+1) * succ(a*2); 
    print z;
    return 0; 
}

------------------------------------------------------------------
Test 9: multiple nested function calls 


def succ(x) {
    return x + 1;
}

def main() {
    a = 5;
    z = succ(succ(succ(a)));
    print z;
    return 0; 
}

------------------------------------------------------------------
Test 10: multiple functions calling each other

def succ(x) {
    return x + 1;
}

def times2(x) {
    return x * 2;
}

def f(y) {
    z = succ(y);
    y = times2(z);
    return y;
}

def main() {
    z = f(10);
    print z;
    return 0; 
}

------------------------------------------------------------------

Test 11: Recursion: This calculates the GCD of two numbers; because we only
        have one parameter for a function, I put the second number
	inside the function!
	

def gcd( b) {
    a = 2854;
    while( b != 0 ) {
       t = b; 
       b = a % b; 
       a = t; 
    }
    return a;
}

    
def main() {
    m = 264;
    res = gcd(m);
    print res;
    return 0; 
}

------------------------------------------------------------------
Test 12: Produces the first 20 members of the Hofstader Q sequence
in a sequence of print statements

def Q(n) {
    if(n <= 2) {
        return 1;
    }
    else {
        return Q(n - Q(n-1)) + Q(n - Q(n-2));
    }
}
    
def main() {
    k = 1;
    while(k<20) {
        q = Q(k);
        print q ;
        k = k + 1;
    }
    return 0; 
}

------------------------------------------------------------------




Target Language:  Intermediate Code

The target language for the project is an abstract assembly language for a simple
machine with a stack. It is specified by the following, which is also in the
file ICInterpreter.hs:

data Op = Var' String | Val' Int

data IC_Instruction
        = Plus'  Op Op Op             -- primes are added so that you can use these opcodes in
        | Minus' Op Op Op             -- your compiler without name clashes
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


Here is a pretty-printed version of Test 11, which calculates the
GCD of 2868 and 264:

  0: push
  1: call 13
  2: halt
  3: a = 2868
  4: _t1 = b != 0
  5: bzero _t1 12
  6: jump 7
  7: t = b
  8: _t2 = a % b
  9: b = _t2
  10: a = t
  11: jump 4
  12: return a
  13: m = 264
  14: push
  15: b = m
  16: call 3
  17: _t2 = _ret_val
  18: res = _t2
  19: print "res = " res
  20: return 0

The result of running this example in the ICInterpreter would be a list containing
the result of the print statement in line 19, showing that GCD(2868,264) is 12:

  ICInterpreter> execute icTest11
  Just ["res = 12"]
  
  ICInterpreter>


Further examples of IC Programs are found in the test cases in the
file ICInterpreter.hs.  Use showICProgram to see readable versions
of these programs. 


