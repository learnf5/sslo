# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# create a desktop shortcut / install lab guide
#cat <<'EOF' >/home/student/Desktop/Lab_Guide.desktop
#[Desktop Entry]
#Version=1.0
#Name=Lab Guide
#Icon=document
#Terminal=false
#Type=Application
#Categories=Application;
#EOF
#echo Exec=google-chrome --app=https://f5.bravais.com/s/$brav_id >>/home/student/Desktop/Lab_Guide.desktop
#gio set /home/student/Desktop/Lab_Guide.desktop metadata::trusted true
#chmod +x /home/student/Desktop/Lab_Guide.desktop

# common files for all labs
mkdir Desktop/Lab_Files
#sudo rm Downloads/*.crt
curl --silent https://raw.githubusercontent.com/learnf5/sslo/main/sslo_v9.3_copy_paste.txt --output /home/student/Desktop/Copy-Paste.txt
im-config -n xim

# run this lab's specific tasks saved on GitHub
curl --silent --output /tmp/$LAB_ID.sh https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/$LAB_ID.sh
bash -x /tmp/$LAB_ID.sh
#bash /tmp/$LAB_ID.sh

# common changes to jump VM
sudo ip route add default via 172.16.1.33
sleep 5
sudo ip route del default via 172.16.17.33
#sudo ip route change default via 172.16.1.33

# disable debugging
set +x
