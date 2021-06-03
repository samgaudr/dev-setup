echo -e "${COLOR}Installing prerequisite...${NOCOLOR}"
apt install -y apt-transport-https

echo -e "${COLOR}Adding official GPG key...${NOCOLOR}"
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/

echo -e "${COLOR}Adding stable repository...${NOCOLOR}"
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list
rm -f packages.microsoft.gpg

echo -e "${COLOR}Installing from stable repository...${NOCOLOR}"
apt update
apt install -y code
