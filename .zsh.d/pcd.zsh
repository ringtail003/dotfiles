# https://github.com/trapple/pcd
function pcd() {
  local PCD_FILE=$HOME/.peco/.pcd-favorite
  local PCD_RETURN
  # modify start
  if [ $1 = "--help" ]; then
    echo "usage:"
    echo "  pcd        List favorite directories."
    echo "  pcd .      List current directories, to select by enter key."
    echo "  pcd add .  To add favorite directories."
    echo "  pcd edit   To edit favorite directories."
  else
  # modify end
    if [ $1 ] && [ $1 = "add" ]; then
      if [ $2 ]; then
        ADD_DIR=$2
        if [ $2 = "." ]; then
          ADD_DIR=$(pwd) 
        fi
        echo "add $ADD_DIR to $PCD_FILE"
        echo $ADD_DIR >> $PCD_FILE
      fi
    elif [ $1 ] && [ $1 = "edit" ]; then
      if [ $EDITOR ]; then
        $EDITOR $PCD_FILE
      fi
    elif [ $1 ] && [ $1 = "." ]; then
      PCD_RETURN=$(/bin/ls -F | grep /$ | sort | peco)
    else
      PCD_RETURN=$(cat $PCD_FILE | sort | peco)
    fi

    if [ $PCD_RETURN ]; then
      cd $PCD_RETURN
    fi
  fi
}
