.PHONY: quality style tests

quality:
	black --check --target-version py39 --preview src tests
	isort --check-only src tests
	flake8 src tests

style:
	black --target-version py39 --preview src tests
	isort src tests

tests:
	pytest tests/ --durations 0 -s
