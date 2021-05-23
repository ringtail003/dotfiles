source=$1

if [ -z "$1" ]; then
  echo "
  Usage: ${0##*/} foo/bar.png [color]
  Example: ${0##*/} foo/bar.png gray
  Example: ${0##*/} foo/bar.png \"#C9D1FA\"
  Description: Add border and drop shadow to image.
  "
  exit 0
fi

dist=${source%.*}-border.${source##*.}
color=${2:-gray}

convert ${source} -bordercolor ${color} -border 1 \( +clone -background ${color} -shadow 60x3 \) +swap -composite +repage ${dist}
echo ${dist}
