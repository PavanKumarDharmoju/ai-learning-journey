def safe_factorial(n: int) -> int:
	if n < 0:
		raise ValueError
	elif n > 1000:
		raise OverflowError
	elif n == 0 or n==1:
		return 1
	else:
		return n*safe_factorial(n-1)
