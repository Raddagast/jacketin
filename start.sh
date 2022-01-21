sed -i "/<Port>*/c\  <Port>$PORT</Port>" /app/radarr/config/xdg/Radarr/config.xml
/app/radarr/bin/Radarr -nobrowser -data=/app/radarr/config
