sudo mount /dev/cdrom /media/cdrom
cp /media/cdrom/VMwareTools* ~
cd ~
tar -xvzf VMwareTools*.tar.gz
cd vmware*
sudo ./vmware-install.pl --default
cd ~
rm --force VMwareTools*
rm --force --recursive vmware*
