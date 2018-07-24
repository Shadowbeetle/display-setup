set -eo pipefail

if [ -z $1 ]; then
  echo "path expected, run ./isntall.sh to see usage"
  exit 1 
fi

if [ $1 = "-h" ]; then
    echo "Usage: ./install.sh <install-path>"
    exit 0
fi

start_dir=$(pwd)

if [ -f $1/dispsp ]; then
    echo "A file called dispsp already exists in $1, please remove it then try again"
fi

cd $(dirname "${BASH_SOURCE[0]}")
source_path=$(pwd)

cd $1 

ln -s $source_path/dispsp.sh dispsp

echo "executable created in $1"
