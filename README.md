## Irssi autodl on Arch
Building the image with irssi, and autodl from the AUR.

### Usage
docker run --name irssi-autodl -d -t \
 	-v /home/deniz/.autodl:/home/user/.autodl \
	-v /srv/deluge/watchdir:/home/user/watchdir \
	 uzkodb/irssi-autodl irssi
