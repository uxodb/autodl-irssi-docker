## Irssi autodl on Arch
Building the image with irssi, and autodl from the AUR.

### Usage
```
docker run -d -t \
	--name irssi-autodl \
 	-v /home/deniz/.autodl:/home/user/.autodl \
	-v /srv/deluge/watchdir:/home/user/watchdir \
	 uzkodb/irssi-autodl irssi
```
