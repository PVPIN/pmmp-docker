#/bin/bash

VERSION_DATA=$(wget -q -O - "https://jenkins.pmmp.io/job/PocketMine-MP-Dev/lastSuccessfulBuild/api/json?pretty=true&tree=url,artifacts[fileName],number,timestamp")

FILENAME=$(echo "$VERSION_DATA" | grep '"fileName"' | cut -d ':' -f2- | tr -d ' ",')
VERSION=$(echo $FILENAME | cut -d '_' -f2- | cut -d '-' -f1)
BUILD=$(echo "$VERSION_DATA" | grep '"number"' | cut -d ':' -f2- | tr -d ' ",')
API_VERSION=$(echo $FILENAME | cut -d '-' -f4- | sed -e 's/\.[^.]*$//')
VERSION_DATE=$(echo "$VERSION_DATA" | grep -m 1 '"timestamp"' | cut -d ':' -f2- | tr -d ' ",')
BASE_URL=$(echo "$VERSION_DATA" | grep '"url"' | cut -d ':' -f2- | tr -d ' ",')
VERSION_DOWNLOAD="${BASE_URL}artifact/${FILENAME}"

echo $VERSION_DOWNLOAD
wget -q -O - "$VERSION_DOWNLOAD" > "plugins/$FILENAME"
