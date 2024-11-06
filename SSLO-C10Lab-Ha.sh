# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

#Download needed files
ucs1=sslo1_cert.ucs
ucs2=sslo2_cert.ucs
curl --silent https://raw.githubusercontent.com/learnf5/sslo/main/certs/RootCertAndKey.pfx --output /home/student/Desktop/Lab_Files/RootCertAndKey.pfx
curl --silent https://raw.githubusercontent.com/learnf5/sslo/main/ucs/$ucs1     --output /tmp/$ucs1
curl --silent https://raw.githubusercontent.com/learnf5/sslo/main/ucs/$ucs2     --output /tmp/$ucs2

# confirm sslo1 and sslo2 are active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
for i in {1..30}; do [ "$(sudo ssh root@192.168.2.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

#prepare sslo1
sudo scp /tmp/$ucs1 192.168.1.31:/var/local/ucs
sudo ssh 192.168.1.31 tmsh load sys ucs $ucs1 no-license

# confirm sslo1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# disable url-db auto-update on sslo1
sudo ssh 192.168.1.31 tmsh modify /sys url-db download-schedule urldb { status false }
sudo ssh 192.168.1.31 tmsh save /sys config

#prepare sslo2
sudo scp /tmp/$ucs2 192.168.2.31:/var/local/ucs
sudo ssh 192.168.2.31 tmsh load sys ucs $ucs2 no-license

# confirm sslo2 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.2.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# disable url-db auto-update
sudo ssh 192.168.2.31 tmsh modify /sys url-db download-schedule urldb { status false }
sudo ssh 192.168.2.31 tmsh save /sys config

# update Student Workstation
touch /tmp/lab10

# confirm sslo1 and sslo2 are active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
for i in {1..30}; do [ "$(sudo ssh root@192.168.2.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# disable debugging
set +x
