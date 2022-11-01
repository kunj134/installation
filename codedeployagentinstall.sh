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
# To verify installation execute below command. 
# sudo service codedeploy-agent status
