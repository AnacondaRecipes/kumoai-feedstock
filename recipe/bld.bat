@echo on

IF "%PY_VER%"=="3.10" (
	%PYTHON% -m pip install --no-deps --no-build-isolation https://pypi.org/packages/cp310/k/kumoai/kumoai-%PKG_VERSION%-cp310-cp310-win_amd64.whl
)

IF "%PY_VER%"=="3.11" (
	%PYTHON% -m pip install --no-deps --no-build-isolation https://pypi.org/packages/cp311/k/kumoai/kumoai-%PKG_VERSION%-cp311-cp311-win_amd64.whl
)

IF "%PY_VER%"=="3.12" (
	%PYTHON% -m pip install --no-deps --no-build-isolation https://pypi.org/packages/cp312/k/kumoai/kumoai-%PKG_VERSION%-cp312-cp312-win_amd64.whl
)

IF "%PY_VER%"=="3.13" (
	%PYTHON% -m pip install --no-deps --no-build-isolation https://pypi.org/packages/cp313/k/kumoai/kumoai-%PKG_VERSION%-cp313-cp313-win_amd64.whl
)

if errorlevel 1 exit 1