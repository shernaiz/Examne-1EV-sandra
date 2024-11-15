# Examne-1EV-sandra

**1 - Explica metodos para abrir unha consola/shell a un contenedor en execución**

Para poder abrir unha consola dentro dun contenedor en execución podremos facelo por exemplo mediante bash co seguinte comando `docker exec -it [nome do contenedor] sh`. Ao facer esto a propia terminal de Linux abriranos un diálogo dentro do contenedor, desde o que podremos lanzar comandos.

**2 - No contenedor anterior (en execución), qué opcións tes que ter usado ó arrincalo para poder interactuar cas túas entradas e salidas**

Teremos que usar a opción sh para que nos permita acceder a el mediante bash e así poidamos empregar comandos do sistema para poder trabalalr dentro del. Esto permitiríanos usar comandos como por exemplo ping.


**3 - Como sería un fichero docker-compose para que dous contenedores se comuniquen entre sí nunha rede só deles**

Un ficheiro docker compose con dous contenedores que se conectan á misma rede tenq ue ser da seguinte forma:

services: 

    contenedor1:

        image: [dirección da imaxe que se quere usar]

        networks:

            red_creada:

    contenedor2: 

        image: [imaxe que queremso usar]

        networks:

            red_creada:

    
networks:

    red_creada:

        name: red_creada

        driver: bridge

Con este .yml deberíanos funcionar o docker compose, xa que ten o mínimo para que os contenedores funcionen e se conecten á rede indicada. Xa que só poñemos o mínimo, como é o nome e as imaxes dos contenedores e indicamoslle á que rede se conectan, ademáis o final definimos a rede para que xa se cree co compose.

**4 - Qué tes que engadir ó ficheiro anterior para que un contenedor teña unha IP fixa?**

Para que un dos contenedores teña unha IP fixa, debaixo do nome da rede á que se conecta debería ter o parámetro ipv4_address: [IP da rede], e quedaría da seguinte forma:

       networks:

            red_creada:

                ipv4: [dirección IP fixa]

Con esto o contenedor lanzaríase ca Ip fixa, sin embargo isto só se permite en compose se a rede ten subredes, polo que tamén teríamos que añadir ao final onde as redes o seguinte:

networks:

    red_creada:

        name: red_creada

        driver: bridge

        ipam:
            config:
                - subnet: [Dirección de rede da subnet]

                  ip_range: [Rango de IPs da subrede] 

                  gateway: [Saída por defecto]

**5 - Qué comando de consola podo usar para saber as IPs dos contenedores anteriores?**

Xa que os anteriores contenedores os lanzamos nunha misma rede, o que podemosé inspeccionar a rede, de forma que nos indicará os contenedores acoplados a esta e cales serán as súas IPs, as súas MAC e os nomes dos contenedores. O comando sería o seguinte: `docker network inspect`.

**6 - Cal é a funcionalidade do apartado "ports" en docker compose?**

O apartado ports permitenos decidir que portos son os que abre o conetenedor para consultas externas, esto úsase normalmente para contenedores que van actuar como servidor DNS xa que necesitan un porto aberto para recibir as consultas. Normalmente teremos que indicar o porto tcp e udp ainda que pode ser o mesmo para ambos protocolos.

**7 - Para que serve o rexistro CNAME?** 

O rexistro CNAME indica o nome canónico do servidor DNS. Trátase dun rexisto que s epode encontrar na configuración do DNS ou pode aparecer ao facerlle algunha consulta a algún servidor DNS.

**8 - Cómo podo facer para que a configuración dun contenedor DNS non se borre se creo outro contenedor**

Para que a configuración dun contenedor DNs non se borre ao crear outro podemos facelo en archivos compose diferentes para que non se pisen entre eles, e así en caso de querer vovler ao anterior sempre estará ahi.

**9 - Engade unha zoa tendaelectronica.int no teu docker DNS que teña:**
**1. www a IP 172.16.0.1**
**2. owncloud sexa un CNAME de www**
**3. un rexistro de texto co contido "1234ASDF"**

