FROM quay.io/darkwinzo/queen:latest
RUN sudo dnf -y update &&\
    sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm &&\
    sudo dnf install -y git ffmpeg ImageMagick nodejs libwebp yarnpkg &&\
    sudo dnf clean all -y
WORKDIR /DarkWinzo
COPY . /DarkWinzo
RUN yarn
CMD ["yarn", "start"]