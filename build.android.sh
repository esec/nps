#/bin/bash
#sudo apt-get install libgl1-mesa-dev xorg-dev
#go get github.com/ffdfgdfg/fyne-cross
#fyne-cross --targets=linux/amd64,windows/amd64,darwin/amd64 gui/npc/npc.go

cd /go
apt-get install libegl1-mesa-dev libgles2-mesa-dev libx11-dev -y
#go get -u fyne.io/fyne/cmd/fyne fyne.io/fyne
mkdir -p /go/src/fyne.io
cd src/fyne.io
git clone https://github.com/fyne-io/fyne.git
cd fyne
git checkout v1.2.0
go install -v ./cmd/fyne
#fyne package -os android fyne.io/fyne/cmd/hello
echo "fyne install success"
mkdir -p /go/src/ehang.io/nps
cp -R /app/* /go/src/ehang.io/nps
cd /go/src/ehang.io/nps
#go get -u fyne.io/fyne fyne.io/fyne/cmd/fyne
rm cmd/npc/sdk.go
#go get -u ./...
#go mod tidy
#rm -rf /go/src/golang.org/x/mobile
echo "tidy success"
cd /go/src/ehang.io/nps
go mod vendor
cd vendor
cp -R * /go/src
cd ..
rm -rf vendor
#rm -rf ~/.cache/*
echo "vendor success"
cd gui/npc
#rm -rf /go/src/golang.org/x/mobile
#go get -u fyne.io/fyne/cmd/fyne@v1.2.0
#export ANDROID_NDK_HOME=/usr/local/android_sdk/ndk-bundle
fyne package -appID org.nps.client -os android -icon ../../docs/logo.png
mv npc.apk /app/android_client.apk