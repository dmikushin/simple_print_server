# Simple Printing Kiosk

A simple way to host a print webapp for a home or small business. Easier than configuring printers on ever-changing computers and simpler for guests to use too. 

<img src="screenshot.png">

## How it works

When a file is uploaded, the server calls the configured command on the path of the uploaded file (default command is `lp`, which adds the file to the CUPS queue)


## Limitations

At this time, this has only been tested with one printer and on Linux and OS X. I have no idea how it would work on Windows, BSD, etc.


## Prerequisites
 
 * Connect a printer to your server of choice
 * Install cups, such as: `sudo apt install cups`
 * Install requirements:

```
cd simple_print_server/
python3 -m venv ./venv/
source ./venv/bin/activate
pip install -r requirements.txt
```


## Manual deployment

```
cd simple_print_server/
source ./venv/bin/activate
python3 ./run.py &
disown -h %
```


## Deployment in Docker

```
docker build -t printing-kiosk:latest .
docker-compose up -d
```

Use `http://127.0.0.1:1631` to configure your printer in CUPS.

