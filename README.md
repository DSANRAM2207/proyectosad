# IES CELIA VIÑAS
----------------------
Este es mi Proyecto de prueba de SAD (Seguridad y Alta Disponibilidad) en 2º ASIR, en el cual estamos simulando la infraestructura y seguridad de una PYME.

# 1. Estructura
----------------------

![](![Estrutura](image.png))

**1. Gateway y Enrutador (gw)**
Actúa como router central, cortafuegos (iptables/nftables) y nodo VPN. Separa físicamente (mediante redes internas
de VirtualBox) todas las subredes.
+ SO: Ubuntu 24.04
+ Hostname: gw-pes
+ Interfaces de red:
    + ethe (NAT): Salida a Internet básica (Vagrant por defecto).
    + eth1 (Bridge): Conexión puente a la red fisica del aula (para  Site-to-Site VPN). IP asignada por el instituto.
    + eth2 (DMZ): 172.1.N.1
    + eth3 (Empleados): 172.2.N.1
    + eth4 (Gestión): 172.3.N.1

**2. LAN de Gestión / Intranet (172.3.N.0/24)**
Red para los servidores críticos internos y la administración. No tiene acceso directo desde Internet. Salida a Internet
enrutada por gw.
+ Proveedor de Identidades (idp)
    + SO: Ubuntu 24.04
    + Hostname: idp-pes
    + IP: 172.3.N.2
    + Rol: Servidor OpenLDAP.
+ Servidor de Backups (backup-srv)
    + SO: Alpine Linux
    + Hostname: backup-srv-pes
    + IP: 172.3.N.20
    + Rol: Tira (pu11) de los datos (mediante rsync y cron) de los demás servidores hacia su almacenamiento local de forma segura.

## 2. Instrucciones para el despliegue
----------------------------------------
**2.1. Requisitos previos**
Tener instalado lo siguiente:
+ Git
+ Virtualbox
+ Vagrant

**2.2. Despliegue**
1. Clonar este repositorio:
   ```bash
    $ git clone https://github.com/pes130/SAD-PROYECTO-2026-26-solucion.git
    ```
2. Levantar con vagrant
    ```bash
    $ cd SAD-PROYECTO-2026-26-solucion
    $ vagrant up
    ```
3. Una vez levantado, comprobamos el estado de las máquinas con:
    ```bash
    $ vagrant status
    ```
4. Y accedemos a las máquinas con vagrant ssh måquina. Ej. para acceder a www:
    ```bash
    $ vagrant ssh www
    ```