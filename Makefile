.PHONY: fmt lint typecheck test cov check ci clean

PYTHON := python
PKG := src
TESTS := tests

fmt:
	$(PYTHON) -m black $(PKG) $(TESTS)

lint:
	$(PYTHON) -m ruff check $(PKG) $(TESTS)
	# Optional import sort if not using Ruff's I rules:
	# $(PYTHON) -m isort $(PKG) $(TESTS)

typecheck:
	$(PYTHON) -m mypy $(PKG)

test:
	pytest

cov:
	pytest --cov=$(PKG) --cov-report=term-missing

check: fmt lint typecheck test

ci:
	$(PYTHON) -m black --check $(PKG) $(TESTS)
	$(PYTHON) -m ruff check $(PKG) $(TESTS)
	$(PYTHON) -m mypy $(PKG)
	pytest --cov=$(PKG) --cov-report=term-missing --maxfail=1 --disable-warnings

clean:
	find . -name "__pycache__" -type d -exec rm -rf {} +
	rm -rf .pytest_cache .mypy_cache .ruff_cache .coverage htmlcov dist build
