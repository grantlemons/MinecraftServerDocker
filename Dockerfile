# escape=`

# Use the official image as a parent image.
FROM openjdk:8-alpine

LABEL name='Minecraft Server' author='Grant Lemons'

# Set the working directory.
WORKDIR /home/minecraft

RUN addgroup -g 1000 minecraft `
&& adduser -Ss /bin/false -u 1000 -G minecraft -h /home/minecraft minecraft `
&& mkdir -m 777 /data `
&& chown minecraft:minecraft /data /home/minecraft `
&& wget -O "latest.jar" https://papermc.io/api/v1/paper/1.16.1/latest/download

EXPOSE 25565

# Run the specified command within the container.
# CMD java -Xms3G -Xmx3G -jar home/minecraft/paper.jar

# ENV PATH_TO_DATA "C:\Users\Grant Lemons\Documents\Code\Docker\Minecraft\data"

# Copy the rest of your app's source code from your host to your image filesystem.
# COPY ${PATH_TO_DATA} ./
COPY data/startup.sh /home/minecraft/startup.sh
COPY data/eula.txt /home/minecraft/eula.txt

CMD sh `
&& java -Xms3G -Xmx3G -jar latest.jar