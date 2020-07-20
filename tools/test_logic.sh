BASEDIR=$(dirname "$0")

. $BASEDIR/utilities.sh


if [ ! -d "$(expandPath ~/miniconda)" ] && [ ! -d "$(expandPath ~/anaconda)" ];
then
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
  bash ~/miniconda.sh -b -p ~/miniconda
  rm ~/miniconda.sh
fi