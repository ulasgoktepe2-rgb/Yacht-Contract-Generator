@echo off
setlocal
echo [AZAMANTA] Initializing...

:: Check for Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not in your PATH.
    echo Please install Python 3.9+ and try again.
    pause
    exit /b
)

echo [AZAMANTA] Installing/Updating dependencies...
python -m pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install dependencies.
    pause
    exit /b
)

echo [AZAMANTA] Launching Backend Server...
:: Start backend WITHOUT --reload to prevent job dictionary from being cleared
start "Azamanta Backend" cmd /k "python -m uvicorn backend.main:app --host 0.0.0.0 --port 8000"

echo [AZAMANTA] Launching Client Interface...
timeout /t 3 >nul
start frontend/index.html

echo [AZAMANTA] System is Live.
echo [INFO] Get your free Gemini API key here: https://aistudio.google.com/app/apikey
echo [INFO] Backend: http://localhost:8000
echo [INFO] Frontend: Opened in browser
pause
