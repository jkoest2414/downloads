#!/bin/bash

mkdir /tmp/branding
cd /tmp/branding

mkdir META-INF
cd /META-INF
wget https://raw.githubusercontent.com/itiligent/Guacamole-Install/main/guac-custom-theme-builder/META-INF/MANIFEST.MF

cd /tmp/branding

mkdir css
cd /css
wget https://raw.githubusercontent.com/jkoest2414/downloads/main/css/custom-theme.css

cd /tmp/branding

mkdir translations
cd /translations
wget https://raw.githubusercontent.com/jkoest2414/downloads/main/translations/en.json

cd /tmp/branding

mkdir images
cd /images
wget https://s.wbcstreaming.com/downloads/fixit/logo.png
wget https://s.wbcstreaming.com/downloads/fixit/logo-64.png
wget https://s.wbcstreaming.com/downloads/fixit/logo-144.png

cd /tmp/branding

wget https://raw.githubusercontent.com/jkoest2414/downloads/main/guac-manifest.json

jar cfmv branding.jar META-INF/MANIFEST.MF guac-manifest.json css images translations META-INF

sudo rm -f /etc/guacamole/extensions/branding.jar

sudo mv branding.jar /etc/guacamole/extensions

sudo chmod 664 /etc/guacamole/extensions/branding.jar

sudo systemctl restart guacd && sudo systemctl restart tomcat9 && sudo systemctl restart nginx

# Done
printf "${LGREEN}Guacamole Branding Complete! \n${NC}"

#END OF SCRIPT
