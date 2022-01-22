sed -i "s/replace/${PORT}/g" /config/config.xml
/app/prowlarr/bin/Prowlarr -nobrowser -data=/config
