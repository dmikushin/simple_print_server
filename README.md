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
 * Install requirements and perform the first run:

```
cd simple_print_server/
python3 -m venv ./venv/
source ./venv/bin/activate
pip install -r requirements.txt
python3 ./firstrun.py
```


## Manual deployment

```
cd simple_print_server/
source ./venv/bin/activate
python3 ./run.py &
disown -h %
```


## Configuration

In order to make the service visible on the network, you may need to do one of the following:

 * Change `app.run()` to `app.run('host=0.0.0.0')` in `run.py`
 * Do something else to forward the local port  


## Deployment as a systemd service

TODO

