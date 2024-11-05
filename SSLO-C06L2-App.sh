# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

#Download needed files
ucs=sslo1_gw_proxy.ucs
curl --silent https://raw.githubusercontent.com/learnf5/sslo/main/certs/RootCertAndKey.pfx --output /home/student/Desktop/Lab_Files/RootCertAndKey.pfx
curl --silent https://raw.githubusercontent.com/learnf5/sslo/main/ucs/$ucs     --output /tmp/$ucs

# confirm sslo1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

#load sslo1 with UCS file
sudo scp /tmp/$ucs 192.168.1.31:/var/local/ucs
sudo ssh 192.168.1.31 tmsh load sys ucs $ucs no-license

# confirm bigip1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# disable url-db auto-update
sudo ssh 192.168.1.31 tmsh modify /sys url-db download-schedule urldb { status false }
sudo ssh 192.168.1.31 tmsh save /sys config

# update Student Workstation
touch /tmp/lab6.2

# confirm bigip1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# disable debugging
set +x
