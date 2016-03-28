#!/usr/bin/env bash
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 config_root_dir get_ui_Y_N" >&2
  exit 1
fi
rootdir="$1"
CONSUL_VERSION=0.6.0
CONSUL_URL_BASE=https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}
sudo apt-get install zip -y
sudo apt-get install -y unzip
sudo apt-get install -y curl

# Get Consul.
cd /tmp
wget ${CONSUL_URL_BASE}_linux_amd64.zip -O consul.zip
cd /usr/local/bin/
mv /tmp/consul.zip .
sudo unzip consul.zip
sudo chmod +x /usr/local/bin/consul

# Get UI if needed.
sudo mkdir -p /usr/local/bin/dist
if [ "$2" == "Y" ]; then
    echo Downloading and installing ui
    cd /tmp
    wget ${CONSUL_URL_BASE}_web_ui.zip -O ui.zip
    cd /usr/local/bin/dist
    mv /tmp/ui.zip .
    sudo unzip ui.zip
    sudo rm ui.zip
fi

# Consul directories and files.
sudo mkdir -p /etc/consul.d
sudo chmod a+w /etc/consul.d
sudo mkdir -p /tmp/consul
sudo chmod a+w /tmp/consul
cp /vagrant/${rootdir}/*.* /etc/consul.d/
sudo chmod a+wrx /etc/consul.d/*.*
sudo cp /vagrant/common/consul.conf /etc/init/consul.conf
sudo rm /etc/motd
sudo cp /vagrant/common/motd.txt /etc/motd

# Start consul.
sudo start consul

# Now lets do Vault
VAULT_VERSION="0.5.1"
wget -q -O /tmp/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip
unzip -d /tmp /tmp/vault.zip
mv /tmp/vault /usr/bin
cp /vagrant/common/vault-upstart.conf /etc/init/vault.conf
rm -f /tmp/vault.zip
export VAULT_ADDR=http://127.0.0.1:8200
vault init > /tmp/vault-init.log
vault server -dev
cat /tmp/vault-init.log | grep "Initial Root Token" | awk 'BEGIN { FS="[ ]" }; {print $4}' > /vagrant/vault-root-token
eval vault auth `cat /vagrant/vault-root-token`
