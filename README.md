## Irssi-autodl on Arch
Building the image with irssi, and autodl from the AUR.

### Usage
```
docker run -d -t \
	--name irssi-autodl \
 	-v /home/uxodb/.autodl:/home/irssi/.autodl \
	-v /srv/deluge/watchdir:/home/irssi/watchdir \
	 uxodb/irssi-autodl irssi
```
