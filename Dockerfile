# escape=`

FROM openjdk:8-alpine

LABEL name='Minecraft Server' author='Grant Lemons'

WORKDIR /home/minecraft

RUN addgroup -g 1000 minecraft `
&& adduser -Ss /bin/false -u 1000 -G minecraft -h /home/minecraft minecraft `
&& mkdir -m 777 /data `
&& chown minecraft:minecraft /data /home/minecraft `
&& wget -O "latest.jar" https://papermc.io/api/v1/paper/1.16.1/latest/download

EXPOSE 25565

COPY ./data/ /home/minecraft/

RUN chmod 700 /home/minecraft/startup.sh

CMD ./startup.sh