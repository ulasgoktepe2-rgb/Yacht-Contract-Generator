import os
import sys

# Define the base directory (where wsgi.py lives)
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Add the project directory to the sys.path so Python can find 'backend'
if BASE_DIR not in sys.path:
    sys.path.append(BASE_DIR)

# Import the FastAPI application from the backend package
from backend.main import app as fastapi_app

# Import the ASGI to WSGI adapter
from a2wsgi import ASGIMiddleware

# PythonAnywhere's WSGI server looks for an object named exactly 'application'
application = ASGIMiddleware(fastapi_app)
