# Take screenshots with a 10 second interval on an android device 360 times... with delay this equates to roughly 1.5 hours:
for i in {1..360}; do adb shell "am start -a android.media.action.IMAGE_CAPTURE" && sleep 1 && adb shell "input keyevent 27" && sleep 10; done


# Un-archive all files beginning with part1.rar
for i in *part1.rar; do 7z x $i -y; done


# Counts lines of file types in a git repo:
git ls-files | grep '.py\|.html' | xargs cat | wc -l


# Listens on HTTP requests over a connection and returns a list of visited sites:
sudo ngrep -q -d wlp3s0 -W byline port 80 | grep Host


# Downloads everything from a specified moodle course without the need to patch wget:
wget --save-cookies cookies.txt --keep-session-cookies --post-data 'username=YOUR_USER_ID&password=YOUR_PASSWORD' https://moodle2.gla.ac.uk/login/index.php && wget --load-cookies cookies.txt --keep-session-cookies --save-cookies cookies.txt --content-disposition --referer=http://moodle2.gla.ac.uk.com/login/index.php -m -E -k --reject logout*,*cal_m*,*cal_y*,post.php*,*subscribe*,help.php*,enrol.php*,discuss.php*,search.php*,recent.php* -l 1 --exclude-directories=/calendar http://moodle2.gla.ac.uk/course/view.php?id=789


# Store git details using libsecret (n.b. must be installed and built using makefile https://github.com/git/git/tree/master/contrib/credential/libsecret)
git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret


# Forcefully removes and deletes all docker containers and images
docker rm -fv $(docker ps -a -q) && docker rmi $(docker images -q)


# Adds current user to docker usergroup allowing for use without sudo
sudo groupadd docker && sudo gpassword -a ${USER} docker && sudo service docker restart && newgrp docker
