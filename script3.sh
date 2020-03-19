#!/bin/bash
#Aqui va el codigo
#Esta linea solo es para crear una copia por cualquier cosa del archivo a modificar
cp /etc/network/interfaces /etc/network/interfaces.original
#Esta seccion presenta las opciones necesarias
echo "Para ajustar la red usando DHCP escribe: 1"
echo "Para ajustar la red con ip estatico en casa escribe: 2"
echo "Para ajustar la red con ip estatico el trabajo escribe: 3"
echo ""
echo ""
#Esta seccion es para esperar la eleccion del usuario
read -p "Escribe el numero: " i
#En esta seccion valida la opcion del usuario
if [ $i -eq 1 ]
then
    #Estos comandos eliminan el contenido anterior y lo sustituye por para habilitar DHCP
    echo source /etc/network/interfaces.d/* > /etc/network/interfaces
    echo  >> /etc/network/interfaces
    echo auto lo enp0s3 >> /etc/network/interfaces
    echo allow-hotplug enp0s3 >> /etc/network/interfaces
    echo  >> /etc/network/interfaces
    echo iface lo inet loopback >> /etc/network/interfaces
    echo  >> /etc/network/interfaces
    echo iface enp0s3 inet dhcp >> /etc/network/interfaces
elif [ $i -eq 2 ]
then
    #Estos comandos eliminan el contenido anterior y lo sustituyen por para habilitar ip estatico en casa
    echo source /etc/network/interfaces.d/* > /etc/network/interfaces
    echo  >> /etc/network/interfaces
    echo auto lo enp0s3 >> /etc/network/interfaces
    echo allow-hotplug enp0s3 >> /etc/network/interfaces
    echo  >> /etc/network/interfaces
    echo iface lo inet loopback >> /etc/network/interfaces
    echo  >> /etc/network/interfaces
    echo iface enp0s3 inet static >> /etc/network/interfaces
    echo address 192.168.100.60/24 >> /etc/network/interfaces
    echo gateway 192.168.100.1 >> /etc/network/interfaces
    echo dns-nameservers 8.8.8.8 1.1.1.1 >> /etc/network/interfaces
elif [ $i -eq 3]
then
    #Estos comandos eliminan el contenido anterior y lo sustituyen por para habilitar ip estatico en casa
    echo source /etc/network/interfaces.d/* > /etc/network/interfaces
    echo  >> /etc/network/interfaces
    echo auto lo enp0s3 >> /etc/network/interfaces
    echo allow-hotplug enp0s3 >> /etc/network/interfaces
    echo  >> /etc/network/interfaces
    echo iface lo inet loopback >> /etc/network/interfaces
    echo  >> /etc/network/interfaces
    echo iface enp0s3 inet static >> /etc/network/interfaces
    echo address 192.168.100.60/24 >> /etc/network/interfaces
    echo gateway 192.168.100.1 >> /etc/network/interfaces
    echo dns-nameservers 8.8.8.8 1.1.1.1 >> /etc/network/interfaces
else
    echo "Esa no era una opcion, intenta de nuevo"
fi
#Esta lina de codigo es para reiniciar el servicio de conexion para que se efectuen los cambios
 /etc/init.d/networking restart

