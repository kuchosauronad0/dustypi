# dylos_dustypi
This repository is meant to be used on a raspberry pi running raspbian 9 (stretch) to collect data from a [Dylos DC1700](http://www.dylosproducts.com/dc1700.html) air quality monitoring device which is then transmitted to an influxdb.
Input data is read from /dev/ttyUSB0 (defined in dustypi.service) and expected to be in the form of [0-9]+,[0-9]+<CR><LF>


## Installation
You can either install the provided *.deb package or run deb-packaging-dusty.sh to create the .deb file or use the Makefile to do this. After all this is nothing but a bunch of shell scripts with a systemd unit and a manpage.
```
sudo dpkg -i dustypi_0.0.5-1_all.deb
or
sudo make install
```

## Configuration
Adjust /etc/dustypi/dustypi.conf to your taste

## Usage
```
systemctl enable dustypi.service 
systemctl start dustypi.service
```

| Option |  |
| ---- | ---- |
| -d --debug | test database connectivity and generate the expected curl query |
| -h --help | prints a short help message |
