def is_greater_then_or_eq_to_zero(n):
    if n == 0:
        print("0 >= 0, by rule 1")
    else:
        print(n, ">=", n-1, "by rule 2")
        is_greater_then_or_eq_to_zero(n-1)


is_greater_then_or_eq_to_zero(100)
