sed -i "s/replace/${PORT}/g" /config/config.xml
mono /app/sonarr/bin/Sonarr.exe -nobrowser -data=/config
