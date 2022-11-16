

########################################### INSTRUCTION #############################################
# open the crontab from your terminal by typing "crontab -e" and then copy and paste 
#####################################################################################################


# download option data every hour and store log files
0 * * * * python3 "src/option-data-download.py" >> logs/option-data-5min-download-log.log


# at the end of each day create a .csv file with daily values
58 23 * * * sqlite3 -header -csv /home/giddinsh/deliverables/option-data-hourly.db "select * from btc_option_data;" > csv_files/btc_option_data.csv
58 23 * * * sqlite3 -header -csv /home/giddinsh/deliverables/option-data-hourly.db "select * from eth_option_data;" > csv_files/eth_option_data.csv

# initialize the data base at 23:59
59 23 * * * rm /home/giddinsh/deliverables/option-data-hourly.db

# zip the csv file at 00.05
5 0 * * * zip -9 -r btc_option_data.zip ./csv_files/btc_option_data.csv
5 0 * * * zip -9 -r eth_option_data.zip ./csv_files/eth_option_data.csv

# move the zipped files to the zip_files folder and rename it with timestamp (YYYYMMDD) at 00.15
15 00 * * * sh /home/giddinsh/src/move_files.sh

# remove the excel files at 00.30
30 0 * * * rm /home/giddinsh/csv_files/btc_option_data.csv
30 0 * * * rm /home/giddinsh/csv_files/eth_option_data.csv
