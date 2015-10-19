#!/bin/bash

mkdir -p /var/media
mkdir -p /var/madsonic
mkdir -p /opt/madsonic

curl -o /opt/madsonic/madsonic.zip -L http://www.madsonic.org/download/5.1/20150831_madsonic-5.1.5260-standalone.zip
curl -o /opt/madsonic/transcode.zip -L http://www.madsonic.org/download/transcode/20141017_madsonic-transcode_latest_x64.zip

unzip /opt/madsonic/madsonic.zip -d /opt/madsonic
unzip /opt/madsonic/transcode.zip -d /var/madsonic/transcode

rm /opt/madsonic/madsonic.zip
rm /opt/madsonic/transcode.zip

# force process to run as foreground task
sed -i 's/-jar madsonic-booter.jar > \${LOG} 2>\&1 \&/-jar madsonic-booter.jar > \${LOG} 2>\&1/g' /opt/madsonic/madsonic.sh

chmod -R 775 /opt/madsonic

