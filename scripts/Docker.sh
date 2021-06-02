echo -e "${COLOR}Installing prerequisite...${NOCOLOR}"
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

echo -e "${COLOR}Adding Docker’s official GPG key...${NOCOLOR}"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo -e "${COLOR}Adding Docker stable repository...${NOCOLOR}"
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo -e "${COLOR}Installing Docker from stable repository...${NOCOLOR}"
apt update
apt install -y docker-ce docker-ce-cli containerd.io


echo -e "${COLOR}Setting up Docker for non-root user...${NOCOLOR}"
groupadd docker
usermod -aG docker $RUNNING_USER

echo -e "${COLOR}Installing Docker Compose 1.29.2...${NOCOLOR}"
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose