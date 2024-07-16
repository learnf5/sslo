# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update Student Workstation host for the specific lab
touch /tmp/lab1.txt

# confirm bigip1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# NOTHING specific for this lab - only the common lab files from common-tasks.sh
