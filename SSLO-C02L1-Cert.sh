# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

#Download needed files
curl --silent https://raw.githubusercontent.com/learnf5/sslo/main/certs/RootCertAndKey.pfx --output /home/student/Desktop/Lab_Files/RootCertAndKey.pfx

# update Student Workstation
touch /tmp/lab2.1

# confirm bigip1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# NOTHING specific for this lab - only the common lab files from common-tasks.sh
