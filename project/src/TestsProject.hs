module TestsProject where

-- Test 1: Just a simple example of expression evaluation
test1 = concat [
   "def main() {                       ",
   "   x = 6;                     ",
   "   y = 8;                    ",
   "   z = x * y / 3 + -x + 2 * y;                     ",
   "   w = z - x % (x - 2);                    ",
   "   print w;                    ",
   "   return 0;                     ",
   "}                    "]

------------------------------------------------------------------
--Test 2:  Conditionals
test2 = concat [
   "def main() {                    ",
   "    x = 4;                    ",
   "    y = 2;                    ",
   "    z = -1;                    ",
   "    if(x > 2) {                    ",
   "        print x;                    ",
   "    }                    ",
   "    if(y < 2) {                    ",
   "        print y;                    ",
   "    }                    ",
   "    if(z != 2) {                    ",
   "        print z;                    ",
   "    } else {                    ",
   "        print y;                    ",
   "    }                    ",
   "    print z;                    ",
   "    if(z <= y) {                    ",
   "        print x;                    ",
   "        if(x + y > z) {                    ",
   "            print y;                    ",
   "        }                    ",
   "        else {                    ",
   "            print z;                    ",
   "        }                    ",
   "    } else {                    ",
   "        print z;                     ",
   "    }                    ",
   "    return 0;                     ",
   "}                    "]



------------------------------------------------------------------
--Test 3: While loops -- sum the numbers from 1 to 10
test3 = concat [
   "def main() {                    ",
   "   k = 1;                    ",
   "   sum = 0;                    ",
   "                    ",
   "   while ( k <= 10 ) {                    ",
   "      sum = sum + k;                    ",
   "      k = k + 1;                    ",
   "   }                    ",
   "                    ",
   "   print sum;                    ",
   "   return 0;                     ",
   "}                    "]


------------------------------------------------------------------
-- Test 4: nested while loops -- for (n,m) with 1 <= n <= 3 and 1 <= m <= 4,
-- count for how many pairs n evenly divides m.
test4 = concat [
   "def main() {                    ",
   "   n = 1;                    ",
   "                    ",
   "   count = 0;                    ",
   "                    ",
   "   while ( n <= 3 ) {                    ",
   "      m = 1;                    ",
   "      while ( m <= 4 ) {                    ",
   "         if ( m % n == 0 ) {                    ",
   "            count = count + 1;                    ",
   "         }                    ",
   "         m = m + 1;                    ",
   "      }                    ",
   "      n = n + 1;                    ",
   "   }                    ",
   "                    ",
   "   print count;                    ",
   "   return 0;                     ",
   "                    ",
   "}                    "]


------------------------------------------------------------------
--Test 5: Nested While and If statements: output the first 10 primes
test5 = concat [
   "def main() {                    ",
   "   count = 0;                    ",
   "   limit = 10;                    ",
   "   n = 2;                       ",
   "                    ",
   "   while (count <= limit) {                     ",
   "      isPrime = 1;                    ",
   "      k = 2;                    ",
   "      while ( k < n ) {                    ",
   "         if (n % k == 0) {                    ",
   "            isPrime = 0;                    ",
   "         }                    ",
   "         k = k + 1;                    ",
   "      }                    ",
   "      if (isPrime==1) {                    ",
   "         print n;                    ",
   "         count = count + 1;                    ",
   "      }                    ",
   "      n = n + 1;                    ",
   "   }                    ",
   "   return 0;                    ",
   "}                    "]



------------------------------------------------------------------
--Test 6:  Basic Boolean expressions -- short-circuit evaluation
test6 = concat [
   "def main() {                    ",
   "                    ",
   "    x = 3;                    ",
   "    y = 5;                    ",
   "    z = 1;                    ",
   "                        ",
   "    if( x > 2 && y < 5) {                    ",
   "        print x;                    ",
   "    }                    ",
   "                        ",
   "    if( x > 2 || y < 5) {                    ",
   "        print x;                    ",
   "    }                    ",
   "                        ",
   "    if( x > 2 && y < 5 || !(z == 2)) {                    ",
   "        print x;                    ",
   "    }                        ",
   "                    ",
   "    if(z != 2 || x > 2 && y < 5) {                    ",
   "        print x;                    ",
   "    }                    ",
   "    return 0;                     ",
   "}                    "]


------------------------------------------------------------------
--Test 7: Basic function call
test7 = concat [
   "def f(x) {                    ",
   "    n = x + 1;                    ",
   "    n = n * 2;                    ",
   "    return n;                    ",
   "}                    ",
   "                    ",
   "def main() {                    ",
   "    y = 2;                    ",
   "    n = 3;                    ",
   "    z = f(y+n);                    ",
   "    print z;                    ",
   "    return 0;                     ",
   "}                    "]

------------------------------------------------------------------
--Test 8: multiple function calls 
test8 = concat [
   "def succ(x) {                    ",
   "    return x + 1;                    ",
   "}                    ",
   "                    ",
   "def main() {                    ",
   "    a = 1;                     ",
   "    z = succ(a) + succ(a+1) * succ(a*2);                     ",
   "    print z;                    ",
   "    return 0;                     ",
   "}                    "]

------------------------------------------------------------------
--Test 9: multiple nested function calls 
test9 = concat [
   "def succ(x) {                    ",
   "    return x + 1;                    ",
   "}                    ",
   "                    ",
   "def main() {                    ",
   "    a = 5;                    ",
   "    z = succ(succ(succ(a)));                    ",
   "    print z;                    ",
   "    return 0;                     ",
   "}                    "]

------------------------------------------------------------------
--Test 10: multiple functions calling each other
test10 = concat [
   "def succ(x) {                    ",
   "    return x + 1;                    ",
   "}                    ",
   "                    ",
   "def times2(x) {                    ",
   "    return x * 2;                    ",
   "}                    ",
   "                    ",
   "def f(y) {                    ",
   "    z = succ(y);                    ",
   "    y = times2(z);                    ",
   "    return y;                    ",
   "}                    ",
   "                    ",
   "def main() {                    ",
   "    z = f(10);                    ",
   "    print z;                    ",
   "    return 0;                     ",
   "}                    "]

------------------------------------------------------------------

--Test 11: Recursion: This calculates the GCD of two numbers; because we only
--        have one parameter for a function, I put the second number
--	inside the function!
test11 = concat [
   "def gcd( b) {                    ",
   "    a = 2854;                    ",
   "    while( b != 0 ) {                    ",
   "       t = b;                     ",
   "       b = a % b;                     ",
   "       a = t;                     ",
   "    }                    ",
   "    return a;                    ",
   "}                    ",
   "                    ",
   "                        ",
   "def main() {                    ",
   "    m = 264;                    ",
   "    res = gcd(m);                    ",
   "    print res;                    ",
   "    return 0;                     ",
   "}                    "]

------------------------------------------------------------------
--Test 12: Produces the first 20 members of the Hofstader Q sequence
--in a sequence of print statements
test12 = concat [
   "def Q(n) {                    ",
   "    if(n <= 2) {                    ",
   "        return 1;                    ",
   "    }                    ",
   "    else {                    ",
   "        return Q(n - Q(n-1)) + Q(n - Q(n-2));                    ",
   "    }                    ",
   "}                    ",
   "                       ",
   "def main() {                    ",
   "    k = 1;                    ",
   "    while(k<20) {                    ",
   "        q = Q(k);                    ",
   "        print q;                    ",
   "        k = k + 1;                    ",
   "    }                    ",
   "    return 0;                     ",
   "}                    "]

------------------------------------------------------------------


