
echo -e "${COLOR}Adding the HashiCorp GPG key...${NOCOLOR}"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

echo -e "${COLOR}Adding the official HashiCorp Linux repository...${NOCOLOR}"
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

echo -e "${COLOR}Installing $software_name...${NOCOLOR}"
apt-get update && sudo apt-get install terraform

echo -e "${COLOR}Verifying $software_name installation...${NOCOLOR}"
terraform -version