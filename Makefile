.PHONY: quality style tests

quality:
	black --check --target-version py39 --preview src/package tests
	isort --check-only src/package tests
	flake8 src/package tests

style:
	black --target-version py39 --preview src/package tests
	isort src/package tests

tests:
	pytest tests/ --durations 0 -s