# apt-get update 
# apt update
# apt upgrade

# apt install python3 python3-pip -y

# apt install --fix-missing libxinerama-dev libxcursor-dev xorg-dev libglu1-mesa-dev libglew-dev ninja-build nasm libicu-dev zip -y

# apt install --fix-missing  gcc-14 g++-14 -y
# update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 130 --slave /usr/bin/g++ g++ /usr/bin/g++-14 --slave /usr/bin/gcov gcov /usr/bin/gcov-14
# update-alternatives --set gcc /usr/bin/gcc-14

# apt-get install build-essential libgl1-mesa-dev libgstreamer-gl1.0-0 
# libpulse-dev libxcb-glx0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 
# libxcb-randr0 libxcb-render-util0 libxcb-render0 libxcb-shape0 
# libxcb-shm0 libxcb-sync1 libxcb-util1 libxcb-xfixes0 libxcb-xinerama0 
# libxcb1 libxkbcommon-dev libxkbcommon-x11-0 libxcb-xkb-dev 
# libxcb-cursor0 -y


# apt-get update
# apt upgrade

echo ">>>>>>>>>>>>>>>py<<<<<<<<<<<<<<<"
# sudo apt install python3-venv

python3 -m venv venv
source venv/bin/activate

pip install numpy sphinx sphinx-rtd-theme recommonmark
pip install setuptools>=70.1.0 py7zr==0.20.*
pip install aqtinstall

echo ">>>>>>>>>>>>>>>qt<<<<<<<<<<<<<<<"
aqt version
aqt -c /app/aqt_conf.ini install-qt linux desktop 6.9.0 linux_gcc_64 --outputdir /app/qt --archives qtbase qtsvg icu

echo ">>>>>>>>>>>>>>>clonning<<<<<<<<<<<<<<<"
git clone https://github.com/inviwo/inviwo
git clone https://github.com/microsoft/vcpkg
cd vcpkg
git reset --hard `grep -Po '"baseline" *: *"\K\w+(?=")' ../inviwo/vcpkg.json`
./bootstrap-vcpkg.sh
cd ..
git clone https://github.com/inviwo/modules

echo ">>>>>>>>>>>>>build<<<<<<<<<<<<<"
cmake -S inviwo ninja-user-apt \
    -DCMAKE_PREFIX_PATH=/app/qt/6.9.0/gcc_64/lib/cmake/Qt6

