chrome_mirror="https://dl.google.com/linux/direct"
chrome_package="google-chrome-stable_current_amd64.deb"

wget "$chrome_mirror/$chrome_package"
sudo apt install "./$chrome_package" -y
rm -rf $chrome_package