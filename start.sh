sed -i "s/replace/${PORT}/g" /config/config.xml
/app/radarr/bin/Radarr -nobrowser -data=/config
