#!/bin/bash
# Privacy Policy Extraction Installation Script
# 
# (Developed and tested with Ubuntu 20.04.3-Desktop)

OPEN_WPM_DIRECTORY=../OpenWPM

if ! command -v conda &> /dev/null
then
    echo "Conda could not be found. Installing Miniconda..."
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    chmod +x Miniconda3-latest-Linux-x86_64.sh
    source Miniconda3-latest-Linux-x86_64.sh
fi

echo "Cloning latest version of OpenWPM..."
git clone https://github.com/openwpm/OpenWPM.git $OPEN_WPM_DIRECTORY
cd $OPEN_WPM_DIRECTORY || exit 1
source install.sh 

conda activate openwpm || exit 1
pip3 install lxml cchardet || exit 1

echo "Copy link detection scripts to OpenWPM directory..."
mv ../Unifying-Privacy-Policy-Detection/privacy_policy_link_detection/*.py .
echo "You can now run the demo by exectuting the following command:"
echo "python3 demo_privacy_policy_download.py"
