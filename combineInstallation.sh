#################################################################################################################################
# Nginx & Wordpress Installation & Configuration 
#################################################################################################################################

#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt autoremove --purge
sudo apt autoclean
sudo apt install nginx unzip php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-fpm php-mysql -y
sudo wget https://wordpress.org/latest.zip
sudo unzip latest.zip
cd wordpress/
sudo cp -r * /var/www/html/ 
sudo chown -R www-data:www-data /var/www/html/
cd /etc/nginx/sites-enabled/
sudo wget https://codeload.github.com/kunj134/nginx-config/zip/refs/heads/main
sudo unzip main
sudo mv nginx-config-main/wordpress /etc/nginx/sites-enabled/
sudo systemctl reload php7.4-fpm.service
sudo rm -rf default main nginx-config-main/
sudo systemctl reload nginx
cd ~

#################################################################################################################################
# Unified Cloudwatch Agent Installation
#################################################################################################################################

#!/bin/bash
sudo wget https://s3.us-east-2.amazonaws.com/amazoncloudwatch-agent-us-east-2/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
#sudo aws configure --profile AmazonCloudWatchAgent
#sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:configuration-file-path

#################################################################################################################################
# Code deploy agent installation
#################################################################################################################################

#!/bin/bash
sudo apt update
sudo apt install ruby-full -y
sudo apt install wget
cd $HOME
# wget https://bucket-name.s3.region-identifier.amazonaws.com/latest/install
# above is a sample set of your url. You can create a url as per your region.
# Reference : https://docs.aws.amazon.com/codedeploy/latest/userguide/resource-kit.html#resource-kit-bucket-names
# Find & replace region values from above reference link & ready your own link.
wget https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
# To verify installation execute below command
# sudo service codedeploy-agent status

#################################################################################################################################
# Packer installation
#################################################################################################################################

#!/bin/bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer

