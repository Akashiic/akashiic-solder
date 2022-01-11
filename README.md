# akashiic-solder

# Instruções
- Em seguida, execute os comandos para compilar e executar a imagem do Docker:
```sh
docker run --name solder-name -d -p 80:80 -v "$(pwd)/www:/var/www/html/" -v "$(pwd)/php:/usr/local/etc/php/" akashiic/solder:1.0
```
