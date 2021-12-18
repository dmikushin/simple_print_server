import os

# DEBUG = True

DATABASE_PATH = os.path.join(os.getcwd(), './data/sqlite.db')
DATABASE_URL = 'sqlite:///{}'.format(DATABASE_PATH)

PRINT_COMMAND = 'lp'

MAX_CONTENT_LENGTH = 128 * 1024 * 1024 # 128 MB
BASE_UPLOAD_FOLDER = './data/uploads'
ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg'])

