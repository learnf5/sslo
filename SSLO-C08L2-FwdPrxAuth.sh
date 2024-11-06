# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

#Download needed files
ucs=sslo1_in_app.ucs
scf=swg_profile.scf
curl --silent https://raw.githubusercontent.com/learnf5/sslo/main/certs/RootCertAndKey.pfx --output /home/student/Desktop/Lab_Files/RootCertAndKey.pfx
curl --silent https://raw.githubusercontent.com/learnf5/sslo/main/ucs/$ucs --output /tmp/$ucs
curl --silent https://raw.githubusercontent.com/learnf5/sslo/main/scf/$scf --output /tmp/$scf

# confirm sslo1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

#load sslo1 with USC file
sudo scp /tmp/$ucs 192.168.1.31:/var/local/ucs
sudo ssh 192.168.1.31 tmsh load sys ucs $ucs no-license

# confirm sslo1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# provision APM on sslo1
sudo ssh 192.168.1.31 tmsh modify sys provision apm level minimum

# confirm sslo1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# merge in swg_profile configs
sudo scp /tmp/$scf 192.168.1.31:/var/local/scf
sudo ssh 192.168.1.31 tmsh load sys config merge file $scf
sudo ssh 192.168.1.31 tmsh modify /sys url-db download-schedule urldb { status false }
sudo ssh 192.168.1.31 tmsh modify /apm profile access SWG_Profile generation-action increment
sudo ssh 192.168.1.31 tmsh save sys config
#sudo ssh 192.168.1.31 reboot

# update Student Workstation
touch /tmp/lab8.2

# confirm bigip1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# disable debugging
set +x
