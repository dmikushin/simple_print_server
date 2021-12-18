#!/usr/bin/env python
import os

from config import DATABASE_PATH, BASE_UPLOAD_FOLDER
from simple_print_server import app
from simple_print_server.database import init_db

def create_db_if_not_created():
    if not os.path.exists(DATABASE_PATH):
        print("Creating database")
        init_db()
    if not os.path.exists(BASE_UPLOAD_FOLDER):
        print("Creating upload folder")
        os.makedirs(BASE_UPLOAD_FOLDER)

if __name__ == "__main__":
    create_db_if_not_created()
    app.run(host='0.0.0.0')
