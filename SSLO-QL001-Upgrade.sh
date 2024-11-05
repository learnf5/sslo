# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

#Download needed files
#rpm=f5-iappslx-ssl-orchestrator-16.0.0-8.2.23.noarch.rpm
pkg=sslo_16.1.4-9.4.15.tgz
#mkdir --parents /home/student/Documents/SSLO/rpm
curl --silent https://raw.githubusercontent.com/learnf5/sslo/main/$pkg --output /home/student/Desktop/Lab_Files/$pkg
cd /home/student/Desktop/Lab_Files/
tar xzf $pkg

# confirm sslo1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

#prepare sslo1
#sudo scp /tmp/$ucs 192.168.1.31:/var/local/ucs
#sudo ssh 192.168.1.31 tmsh load sys ucs $ucs no-license

# update Student Workstation
touch /tmp/labQ1

# confirm bigip1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# disable debugging
set +x
