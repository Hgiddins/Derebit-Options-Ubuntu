

# create a connection with the remote server
ssh ---------------

# install SQLite, Python3, pip and cron
sudo apt-get update
sudo apt install sqlite3
sudo apt install python3
sudo apt-get install -y python3-pip
sudo apt-get install cron

# install python modules
pip3 install pandas
pip3 install tqdm
pip3 install sqlite3

# add python script
pico download-option-data.py


# set up cronjob (see Ubuntu setup file)


