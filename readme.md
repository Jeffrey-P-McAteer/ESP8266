
sudo rm /usr/bin/python
sudo ln -s /usr/bin/python /usr/bin/python2
# Install wants python to mean python2
yay -S esp-open-sdk
# switch it back
sudo ln -s /usr/bin/python /usr/bin/python3




https://www.instructables.com/id/How-to-Write-ESP8266-Firmware-From-Scratch-using-E/
http://fab.cba.mit.edu/classes/863.14/tutorials/Programming/serialwifi.html

yay -S help2man

git clone --recursive https://github.com/pfalcon/esp-open-sdk.git

Will need to edit configure.ac to change 
   
   |$EGREP '^GNU bash, version (3\.[1-9]|4)'
   
to

    |$EGREP '^GNU bash, version (3\.[1-9]|4|5)'


