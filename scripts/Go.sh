
go_mirror="https://golang.org/dl"
go_version=$(set_parameter "Go version" "1.15.2")
go_workspace=$(set_parameter "GOPATH" "$(eval echo ~${SUDO_USER})/go")
go_init_file=/etc/profile.d/golang.sh
go_package="go$go_version.linux-amd64.tar.gz"

echo -e "${COLOR}Downloading $software_name...${NOCOLOR}"
wget -c "$go_mirror/$go_package"

echo -e "${COLOR}Extracting $software_name...${NOCOLOR}"
tar -C /usr/local -xzf $go_package
rm -rf $go_package

echo -e "${COLOR}Creating $software_name workspace...${NOCOLOR}"
mkdir -p "$go_workspace/bin"
mkdir -p "$go_workspace/src"
mkdir -p "$go_workspace/pkg"
chown ${SUDO_USER} "$go_workspace" -R

echo -e "${COLOR}Exporting $software_name environment variable...${NOCOLOR}"
touch $go_init_file
echo "export GOPATH=$go_workspace" >> $go_init_file
echo "export GOBIN=$go_workspace/bin" >> $go_init_file

echo -e "${COLOR}Adding $software_name to PATH...${NOCOLOR}"
echo  "export PATH=$PATH:/usr/local/go/bin" >> $go_init_file
