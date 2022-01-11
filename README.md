<p align="center">
<img src="https://img.icons8.com/nolan/512/technic-launcher.png" width="512" height="512"/>
</p>

# Instruções para instalar o solder
- Em seguida, execute os comandos para compilar e executar a imagem do Docker:
```sh
docker run --name solder-name -d -p 80:80 -p 8000:8000 -v "$(pwd)/www:/var/www/html/" -v "$(pwd)/php:/usr/local/etc/php/" akashiic/solder:1.0
```
