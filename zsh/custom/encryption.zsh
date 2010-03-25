function encrypt {
  if [ "$1" = "" ]; then
    echo "Usage: encrypt filename"
  elif [ -d "$1" ]; then
    echo ""$1" is a directory"
  elif [ -L "$1" ]; then
    echo ""$1" is a symbolic link"
  elif ! [ -r "$1" ]; then
    echo ""$1" is not readable"
  else
    /usr/bin/openssl aes-256-cbc -salt -in "$1" -out "$1".aes
      if [ $? -eq 0 ] ; then
        echo "encryted file: "$1".aes"
      fi
  fi
}

function decrypt {
  if [ "$1" = "" ] || [ "${1##*.}" != aes ]; then
    echo "Usage: decrypt filename.aes"
  else
    /usr/bin/openssl aes-256-cbc -d -salt -in "$1" -out "${1%.aes}" 2>/dev/null
      if [ $? -eq 0 ] ; then
        echo "decryted file: ${1%.aes}"
      else
        /bin/rm "${1%.aes}"
        echo -e "bad decrypt, possible incorrect password \n(${1%.aes} deleted)"
      fi
  fi
}