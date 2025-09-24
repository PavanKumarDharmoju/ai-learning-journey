from src.aj.day2.math_fact import safe_factorial
import pytest

def test_safe_factorial_basic():
	assert safe_factorial(5) == 120

def test_safe_factorial_zero_one():
	assert safe_factorial(0) == 1
	assert safe_factorial(1) == 1

def test_safe_factorial_neg():
	with pytest.raises(ValueError):
		safe_factorial(-1)

def test_safe_factorial_overflow():
	with pytest.raises(OverflowError):
		assert safe_factorial(1001)
