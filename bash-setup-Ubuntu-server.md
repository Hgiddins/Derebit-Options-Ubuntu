# Bash setup script for Ubuntu servers

This is a setup script to automate the setup and provisioning of Ubuntu servers. It does the following:
* Adds SQLite, Python3, pip and cron to the server
* Installs Python modules 
* Setups a cron-job to run a python script
* Adds `.log` file for traceback

# Installation
SSH into your server and install SQLite, Python3, pip and cron if not installed:
```bash
sudo apt-get update
sudo apt install sqlite3
sudo apt install python3
sudo apt-get install -y python3-pip
sudo apt-get install cron
```

Install python modules
```bash
pip3 install pandas
pip3 install tqdm
pip3 install sqlite3
```

# Setup cronjob
Create a cronjob that run the python script `option-data-download.py` everyday at midnight in the crontab page and add `.log` file for traceback.
```bash
crontab -e
00 00 * * * python3 "option-data-download.py" >> option-data-download-log.log
```

# Supported versions
This setup script has been tested against Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-56-generic x86_64)