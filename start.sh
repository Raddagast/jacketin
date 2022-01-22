str="replace"
sed -i "s/${str}/${PORT}/g" /config/Jackett/ServerConfig.json
/app/Jackett/jackett --NoUpdates
