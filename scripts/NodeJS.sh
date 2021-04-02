export NVM_DIR=$USER_HOME/.nvm
export PROFILE=$USER_HOME/.bashrc

mkdir $NVM_DIR

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

echo -e "${COLOR}Installing latest NodeJS LTS${NOCOLOR}"
. $NVM_DIR/nvm.sh
nvm  install --lts

chown -R $RUNNING_USER:$RUNNING_USER $NVM_DIR

unset NVM_DIR
unset PROFILE