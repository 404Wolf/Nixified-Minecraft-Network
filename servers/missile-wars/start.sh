if ! [ -d "server" ]; then
  mkdir -p ./server
  cd ./server
  echo "eula=true" > eula.txt
  cp -r --no-preserve=mode $template/* .
fi

cd server
$java -Xmx8G -Xms8G -jar $server nogui

