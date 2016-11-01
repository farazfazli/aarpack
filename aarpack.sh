green=`tput setaf 2`
yellow=`tput setaf 3`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 7`

echo "${green}Copying files...${magenta}"
cp **/build/outputs/aar/*.aar .
echo "Zipping files...${yellow}"
zip -q pack.zip *.aar
echo "Uploading...${cyan}"
# Adapted from mixtape.moe basic uploader, removed jshon dep
DEST="https://mixtape.moe/upload.php?output=gyazo"
FILE="pack.zip"
CMD=$(basename "$0")
OUT=$(curl -sf -F files[]="@${FILE}" "${DEST}")
if [[ $(echo "$OUT") =~ true ]]; then
                echo $(echo "$OUT")
else
                echo "An error occurred!"
                exit 1
        fi

rm -f pack.zip
rm -f *.aar

echo "${white}Cleaned up"
