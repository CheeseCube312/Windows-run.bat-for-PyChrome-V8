@echo off
echo Py-Chrome Launcher
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH!
    echo Please install Python from https://www.python.org/downloads/
    echo.
    pause
    exit /b 1
)

REM Check if .venv exists
if not exist ".venv\" (
    echo Creating virtual environment...
    python -m venv .venv
    echo Virtual environment created.
    echo.
)

REM Check if dependencies are installed by trying to import dearpygui
.venv\Scripts\python.exe -c "import dearpygui" 2>nul
if errorlevel 1 (
    echo Installing dependencies...
    .venv\Scripts\pip.exe install numpy pillow dearpygui tifffile
    echo Dependencies installed.
    echo.
)

REM Run the application
echo Starting Py-Chrome...
.venv\Scripts\python.exe "OPEN SOURCE Py-Chrome V8.py"
