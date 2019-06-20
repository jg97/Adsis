#!/bin/sh

##inicializacion de la máquina del router interno
cd /misc/alumnos/as2/as22018/a715821

virsh -c qemu:///system define orouter6.xml
sudo virsh start orouter6
sleep 30

echo "El router exterior ha sido ya configurado"

virsh -c qemu:///system define o6ff2.xml
sudo virsh start o6ff2
sleep 30

echo "El unbound ha sido ya configurado"

virsh -c qemu:///system define o6ff3.xml
sudo virsh start o6ff3
sleep 30

echo "El zone master ha sido ya configurado"

virsh -c qemu:///system define o6ff4.xml
sudo virsh start o6ff4
sleep 30

echo "El zone slave ha sido ya configurado"

qemu-img create -f qcow2 -o backing_file=odefecto.qcow2 orouter62.qcow2
chmod 777 orouter62*
virsh -c qemu:///system define orouter62.xml
sudo virsh start router62
sleep 30

##Iniciamos el proceso de configuracion del router interno
### AVISO: Los cambios en el fichero de zonas y en el router exterior deben de estar activos

scp /home/a715821/Documents/despliegue/routerInterno.pp a715821@[2001:470:736b:6ff::6]:/tmp/
ssh a715821@2001:470:736b:6ff::6 "doas puppet apply /tmp/routerInterno.pp"
ssh a715821@2001:470:736b:6ff::6 "doas rm -r /etc/hostname.vlan699"
ssh a715821@2001:470:736b:6ff::6 "doas reboot"
# esperamos a que todos los servicios se reinicien
sleep 45
##simplemente comprobamos que la conexión se puede realizar
ssh a715821@2001:470:736b:620::2 "ls -l"

echo "El router interno ha sido ya configurado"

##encendemos ipa1
virsh -c qemu:///system define ipa1.xml
sudo virsh start ipa1
sleep 30

echo "El ipa1 ha sido ya configurado"

##encendemos ipa2
virsh -c qemu:///system define ipa22.xml
sudo virsh start ipa2
sleep 30

echo "El ipa2 interno ha sido ya configurado"

##configuracion del servidor nfs kerberizado por medio de ipa

qemu-img create -f qcow2 -o backing_file=defecto.qcow2 nfsk12.qcow2
chmod 777 nfsk12*
virsh -c qemu:///system define nfsk12.xml
sudo virsh start nfsk12
sleep 30

##Iniciamos el proceso de configuracion del router interno
### AVISO: Los cambios en el fichero de zonas y en el router exterior deben de estar activos
ssh-copy-id a715821@2001:470:736b:6ff::7
scp /home/a715821/Documents/despliegue/nfsk1Red.pp a715821@[2001:470:736b:6ff::7]:/tmp/
ssh a715821@2001:470:736b:6ff::7 "sudo puppet apply /tmp/nfsk1Red.pp"
ssh a715821@2001:470:736b:6ff::7 "sudo rm -r /etc/sysconfig/network-scripts/ifcfg-eth0.699"
ssh a715821@2001:470:736b:6ff::7 "sudo reboot"
## esperamos a que todos los servicios se reinicien
sleep 45
###simplemente comprobamos que la conexión se puede realizar
ssh-copy-id a715821@2001:470:736b:621::4
ssh a715821@2001:470:736b:621::4 "ls -l"

##procedemos a configurar servidor dns
ssh a715821@2001:470:736b:621::4 "sudo yum -y install ipa-client"
ssh a715821@2001:470:736b:621::4 "sudo reboot"
sleep 45
ssh a715821@2001:470:736b:621::4 "sudo ipa-client-install --force-join --principal admin@2.6.FF.ES.EU.ORG -w 97Gilgamesh.01 --domain 2.6.ff.es.eu.org --server ipa1.2.6.ff.es.eu.org --unattended"
echo "Se va a configurar el servidor dns"
ssh a715821@2001:470:736b:621::2 "echo "97Gilgamesh.01" | kinit admin"
ssh a715821@2001:470:736b:621::2 "ipa service-add nfs/nfsk1.2.6.ff.es.eu.org"
ssh a715821@2001:470:736b:621::4 "echo "97Gilgamesh.01" | sudo kinit admin"
ssh a715821@2001:470:736b:621::4 "sudo authconfig --enablemkhomedir --update"
ssh a715821@2001:470:736b:621::4 "sudo /usr/sbin/ipa-getkeytab -s ipa1.2.6.ff.es.eu.org -p nfs/nfsk1.2.6.ff.es.eu.org -k /etc/krb5.keytab"
scp /home/a715821/Documents/despliegue/etc5.pp a715821@[2001:470:736b:621::4]:/tmp/
ssh a715821@2001:470:736b:621::4 "sudo puppet apply /tmp/etc5.pp"
ssh a715821@2001:470:736b:621::4 "sudo ipa-client-automount --unattended"
ssh a715821@2001:470:736b:621::4 "sudo systemctl restart nfs.service"
ssh a715821@2001:470:736b:621::4 "sudo systemctl restart nfs-server.service"


echo "El servidor nfsk1 ha sido ya configurado"


qemu-img create -f qcow2 -o backing_file=defecto.qcow2 cliente12.qcow2
chmod 777 cliente12*
virsh -c qemu:///system define cliente12.xml
sudo virsh start cliente12
sleep 30

##Iniciamos el proceso de configuracion del router interno
### AVISO: Los cambios en el fichero de zonas y en el router exterior deben de estar activos
ssh-copy-id a715821@2001:470:736b:6ff::7
scp /home/a715821/Documents/despliegue/cliente1Red.pp a715821@[2001:470:736b:6ff::7]:/tmp/
ssh a715821@2001:470:736b:6ff::7 "sudo puppet apply /tmp/cliente1Red.pp"
ssh a715821@2001:470:736b:6ff::7 "sudo rm -r /etc/sysconfig/network-scripts/ifcfg-eth0.699"
ssh a715821@2001:470:736b:6ff::7 "sudo reboot"

sleep 45
ssh-copy-id a715821@2001:470:736b:622:5054:ff:fe06:2202
###simplemente comprobamos que la conexión se puede realizar
ssh a715821@2001:470:736b:622:5054:ff:fe06:2202 "ls -l"

##procedemos a configurar servidor dns
ssh a715821@2001:470:736b:622:5054:ff:fe06:2202 "sudo yum -y install ipa-client"
ssh a715821@2001:470:736b:622:5054:ff:fe06:2202 "sudo reboot"
sleep 45
ssh a715821@2001:470:736b:622:5054:ff:fe06:2202 "sudo ipa-client-install --force-join --principal admin@2.6.FF.ES.EU.ORG -w 97Gilgamesh.01 --domain 2.6.ff.es.eu.org --server ipa1.2.6.ff.es.eu.org --unattended"

ssh a715821@2001:470:736b:622:5054:ff:fe06:2202 "echo "97Gilgamesh.01" | sudo kinit admin"
ssh a715821@2001:470:736b:621::2 "ipa service-add nfs/cliente1.2.6.ff.es.eu.org"
ssh a715821@2001:470:736b:622:5054:ff:fe06:2202 "sudo /usr/sbin/ipa-getkeytab -s ipa1.2.6.ff.es.eu.org -p nfs/cliente1.2.6.ff.es.eu.org -k /etc/krb5.keytab"
ssh a715821@2001:470:736b:622:5054:ff:fe06:2202 "sudo ipa-client-automount --unattended"
scp /home/a715821/Documents/despliegue/automount.pp a715821@[2001:470:736b:622:5054:ff:fe06:2202]:/tmp/
ssh a715821@2001:470:736b:622:5054:ff:fe06:2202 "sudo puppet apply /tmp/automount.pp"
ssh a715821@2001:470:736b:622:5054:ff:fe06:2202 "sudo reboot"
echo "El servidor cliente1 ha sido ya configurado"

###Configuracion del cliente2

qemu-img create -f qcow2 -o backing_file=defecto.qcow2 cliente22.qcow2
chmod 777 cliente22*
virsh -c qemu:///system define cliente22.xml
sudo virsh start cliente22
sleep 30

##Iniciamos el proceso de configuracion del router interno
### AVISO: Los cambios en el fichero de zonas y en el router exterior deben de estar activos
ssh-copy-id a715821@2001:470:736b:6ff::7
scp /home/a715821/Documents/despliegue/cliente2Red.pp a715821@[2001:470:736b:6ff::7]:/tmp/
ssh a715821@2001:470:736b:6ff::7 "sudo puppet apply /tmp/cliente2Red.pp"
ssh a715821@2001:470:736b:6ff::7 "sudo rm -r /etc/sysconfig/network-scripts/ifcfg-eth0.699"
ssh a715821@2001:470:736b:6ff::7 "sudo reboot"

sleep 45
ssh-copy-id a715821@2001:470:736b:622:5054:ff:fe06:2203
###simplemente comprobamos que la conexión se puede realizar
ssh a715821@2001:470:736b:622:5054:ff:fe06:2203 "ls -l"

##procedemos a configurar servidor dns
ssh a715821@2001:470:736b:622:5054:ff:fe06:2203 "sudo yum -y install ipa-client"
ssh a715821@2001:470:736b:622:5054:ff:fe06:2203 "sudo reboot"
sleep 45
ssh a715821@2001:470:736b:622:5054:ff:fe06:2203 "sudo ipa-client-install --force-join --principal admin@2.6.FF.ES.EU.ORG -w 97Gilgamesh.01 --domain 2.6.ff.es.eu.org --server ipa1.2.6.ff.es.eu.org --unattended"

ssh a715821@2001:470:736b:622:5054:ff:fe06:2203 "echo "97Gilgamesh.01" | sudo kinit admin"
ssh a715821@2001:470:736b:621::2 "ipa service-add nfs/cliente2.2.6.ff.es.eu.org"
ssh a715821@2001:470:736b:622:5054:ff:fe06:2203 "sudo /usr/sbin/ipa-getkeytab -s ipa1.2.6.ff.es.eu.org -p nfs/cliente2.2.6.ff.es.eu.org -k /etc/krb5.keytab"
ssh a715821@2001:470:736b:622:5054:ff:fe06:2203 "sudo ipa-client-automount --unattended"
scp /home/a715821/Documents/despliegue/automount.pp a715821@[2001:470:736b:622:5054:ff:fe06:2203]:/tmp/
ssh a715821@2001:470:736b:622:5054:ff:fe06:2203 "sudo puppet apply /tmp/automount.pp"
ssh a715821@2001:470:736b:622:5054:ff:fe06:2203 "sudo reboot"


##configuracion del servidor zabbix por medio de ipa

qemu-img create -f qcow2 -o backing_file=defecto.qcow2 zabbix12.qcow2
chmod 777 zabbix12*
virsh -c qemu:///system define zabbix12.xml
sudo virsh start zabbix12
sleep 30

##Iniciamos el proceso de configuracion del router interno
### AVISO: Los cambios en el fichero de zonas y en el router exterior deben de estar activos
ssh-copy-id a715821@2001:470:736b:6ff::7
scp /home/a715821/Documents/despliegue/zabbix1Red.pp a715821@[2001:470:736b:6ff::7]:/tmp/
ssh a715821@2001:470:736b:6ff::7 "sudo puppet apply /tmp/zabbix1Red.pp"
ssh a715821@2001:470:736b:6ff::7 "sudo rm -r /etc/sysconfig/network-scripts/ifcfg-eth0.699"
ssh a715821@2001:470:736b:6ff::7 "sudo reboot"
## esperamos a que todos los servicios se reinicien
sleep 45
###simplemente comprobamos que la conexión se puede realizar
ssh-copy-id a715821@2001:470:736b:621::5
ssh a715821@2001:470:736b:621::5 "ls -l"

##procedemos a configurar servidor dns
ssh a715821@2001:470:736b:621::5 "sudo yum -y install ipa-client"
ssh a715821@2001:470:736b:621::5 "sudo reboot"
sleep 45
ssh a715821@2001:470:736b:621::5 "sudo ipa-client-install --force-join --principal admin@2.6.FF.ES.EU.ORG -w 97Gilgamesh.01 --domain 2.6.ff.es.eu.org --server ipa1.2.6.ff.es.eu.org --unattended"
echo "configuramos servidor zabbix"
ssh a715821@2001:470:736b:621::5 "sudo yum -y install mariadb-server"
ssh a715821@2001:470:736b:621::5 "sudo systemctl start mariadb"
ssh a715821@2001:470:736b:621::5 "sudo systemctl enable mariadb"
ssh a715821@2001:470:736b:621::5 "mysql --user=root <<_EOF_
UPDATE mysql.user SET Password=PASSWORD('97Gilgamesh.01') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
_EOF_"
ssh a715821@2001:470:736b:621::5 "echo \"create database zabbix character set utf8 collate utf8_bin;\" | mysql -uroot -p97Gilgamesh.01"
ssh a715821@2001:470:736b:621::5 "echo \"grant all privileges on zabbix.* to zabbix@localhost identified by '97Gilgamesh.01';\" | mysql -uroot -p97Gilgamesh.01"
ssh a715821@2001:470:736b:621::5 "echo \"flush privileges;\" | mysql -uroot -p97Gilgamesh.01"
ssh a715821@2001:470:736b:621::5 "zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p97Gilgamesh.01 zabbix"
scp /home/a715821/Documents/despliegue/zabbixServer.pp a715821@[2001:470:736b:621::5]:/tmp/
ssh a715821@2001:470:736b:621::5 "sudo puppet apply /tmp/zabbixServer.pp"
ssh a715821@2001:470:736b:621::5 "sudo systemctl restart httpd"
ssh a715821@2001:470:736b:621::5 "sudo systemctl start zabbix-server"
ssh a715821@2001:470:736b:621::5 "sudo systemctl start zabbix-agent"
ssh a715821@2001:470:736b:621::5 "sudo systemctl enable zabbix-server"
ssh a715821@2001:470:736b:621::5 "sudo systemctl enable zabbix-agent"
echo "realizamos configuraciones para zabbix clientes"
scp /home/a715821/Documents/despliegue/zabbixCliente.pp a715821@[2001:470:736b:621::5]:/tmp/
ssh a715821@2001:470:736b:621::5 "sudo puppet apply /tmp/zabbixCliente.pp"
ssh a715821@2001:470:736b:621::5 "sudo systemctl start zabbix-agent"
ssh a715821@2001:470:736b:621::5 "sudo systemctl enable zabbix-agent"
scp /home/a715821/Documents/despliegue/zabbixCliente.pp a715821@[2001:470:736b:621::4]:/tmp/
ssh a715821@2001:470:736b:621::4 "sudo puppet apply /tmp/zabbixCliente.pp"
ssh a715821@2001:470:736b:621::4 "sudo systemctl start zabbix-agent"
ssh a715821@2001:470:736b:621::4 "sudo systemctl enable zabbix-agent"
scp /home/a715821/Documents/despliegue/zabbixCliente.pp a715821@[2001:470:736b:622:5054:ff:fe06:2203]:/tmp/
ssh a715821@2001:470:736b:622:5054:ff:fe06:2203 "sudo puppet apply /tmp/zabbixCliente.pp"
ssh a715821@2001:470:736b:622:5054:ff:fe06:2203 "sudo systemctl start zabbix-agent"
ssh a715821@2001:470:736b:622:5054:ff:fe06:2203 "sudo systemctl enable zabbix-agent"
scp /home/a715821/Documents/despliegue/zabbixCliente.pp a715821@[2001:470:736b:622:5054:ff:fe06:2202]:/tmp/
ssh a715821@2001:470:736b:622:5054:ff:fe06:2202 "sudo puppet apply /tmp/zabbixCliente.pp"
ssh a715821@2001:470:736b:622:5054:ff:fe06:2202 "sudo systemctl start zabbix-agent"
ssh a715821@2001:470:736b:622:5054:ff:fe06:2202 "sudo systemctl enable zabbix-agent"


echo "El servidor zabbix ha sido ya configurado"

