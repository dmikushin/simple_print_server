FROM ubuntu:latest
COPY . /printing-kiosk
WORKDIR /printing-kiosk

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt update && apt install --no-install-recommends -y cups nginx python3 python3.8-venv
RUN python3 -m venv ./venv/
RUN mkdir data
RUN . ./venv/bin/activate && pip install wheel && pip install -r requirements.txt && \
	python -c 'import secrets; print("SECRET_KEY = \"{}\"\n".format(secrets.token_hex(16)))' >> config.py
RUN cp cupsd /etc/nginx/sites-available/cupsd
RUN ln -s /etc/nginx/sites-available/cupsd /etc/nginx/sites-enabled/cupsd
RUN rm /etc/nginx/sites-enabled/default
RUN apt clean

# TODO Use /usr/lib/cups/backend/usb to find the USB URI of a printer,
# and register it to the lpadmin similar to this:
# lpadmin -p HP1020 -E -v "usb://Hewlett-Packard/HP%20LaserJet%201020?serial=FN0JW5E" -m lsb/usr/hplip/HP/hp-laserjet_1020-hpijs.ppd
# SOURCE https://unix.stackexchange.com/questions/350714/how-to-add-a-usb-printer-using-lpadmin

EXPOSE 5000
CMD ["bash", "-c", "\". ./venv/bin/activate && python ./run.py\""]

