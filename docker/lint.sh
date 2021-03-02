#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_html/ tests/

black democritus_html/ tests/

mypy democritus_html/ tests/

pylint --fail-under 9 democritus_html/*.py

flake8 democritus_html/ tests/

bandit -r democritus_html/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_html/ tests/
