git_user_name=$(set_parameter "Git user name" "")
git_user_email=$(set_parameter "Git user email" "")
git_credential_helper="store"
git_core_editor="nano"
bashrc="$(eval echo ~${SUDO_USER})/.bashrc"

apt install git -y

echo -e "${COLOR}Configuring $software_name...${NOCOLOR}"
git config --global user.name "$git_user_name"
git config --global user.email "$git_user_email"
git config --global credential.helper $git_credential_helper
git config --global core.editor $git_core_editor


echo -e "${COLOR}Replacing PS1...${NOCOLOR}"

# Add git_parse_branch function 
touch temp 
cat ./config/parse_git_branch >> temp
cat $bashrc >> temp
mv temp $bashrc


#Replace PS1
sed -i -ne '/if \[ "\$color_prompt" = yes \]; then/ {p; r ./config/ps1' -e ':a; n; /fi/ {p; b}; ba}; p' $bashrc
