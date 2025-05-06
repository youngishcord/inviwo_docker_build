
FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash
    # &&  rm -rf /var/lib/apt/lists/*

RUN apt install python3 python3-pip python3-venv -y

RUN apt install --fix-missing libxinerama-dev \
    libxcursor-dev xorg-dev libglu1-mesa-dev libglew-dev \
    ninja-build nasm libicu-dev zip gcc-14 g++-14 -y

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 130 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-14 \
    --slave /usr/bin/gcov gcov /usr/bin/gcov-14 && \
    update-alternatives --set gcc /usr/bin/gcc-14

RUN apt-get install build-essential libgl1-mesa-dev \
    libgstreamer-gl1.0-0 libpulse-dev libxcb-glx0 \
    libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 \
    libxcb-render-util0 libxcb-render0 libxcb-shape0 libxcb-shm0 \
    libxcb-sync1 libxcb-util1 libxcb-xfixes0 libxcb-xinerama0 \
    libxcb1 libxkbcommon-dev libxkbcommon-x11-0 libxcb-xkb-dev \
    libxcb-cursor0 -y

RUN apt install git ninja-build gcc-14 g++-14 cmake extra-cmake-modules \
    cmake-qt-gui python3 python3-pip python3-numpy python3-h5py \
    python3-pybind11 python3-scipy python3-regex pybind11-json-dev \
    qt6-base-dev qt6-tools-dev qt6-tools-dev libqt6svg6-dev \
    libglew-dev freeglut3-dev xorg-dev openexr zlib1g zlib1g-dev \
    libjpeg-dev libtiff-dev libtirpc-dev libhdf5-dev libpng-dev \
    libglu1-mesa-dev libxrandr-dev libxinerama-dev libxcursor-dev \
    googletest libgtest-dev libglm-dev nlohmann-json3-dev libfmt-dev \
    libglew-dev libfreetype-dev libassimp-dev cimg-dev libnifti-dev \
    libznz-dev libopenexr-dev libtclap-dev -y

RUN apt-get update && apt update && apt upgrade

WORKDIR /app

COPY ./build.sh /app/build.sh

COPY ./aqt_conf.ini /app/aqt_conf.ini

RUN chmod +x /app/build.sh

# RUN python3 -m venv venv && source venv/bin/activate

# CMD [ "bash", "/app/build.sh" ]
