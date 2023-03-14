#! /bin/bash
git config --global user.email "stevester94@gmail.com"
git config --global user.name "Steven Mackey"
git config --global init.defaultBranch master
git config --global diff.tool vimdiff
git config --global difftool.prompt false

echo "Now configuring git credential storage"
echo "Configure git to store credentials forever in clear text: F"
echo "Configure git to store credentials for 15 minutes in a secure daemon: D"
echo "Skip configuration: S"

while true; do
    read -p "Credential Storage Mode: " ans 
    if [[ $ans = F ]]; then
        echo Configuring to store forever
        git config --global credential.helper store
        break
    elif [[ $ans = D ]]; then
        echo Configuring to store in daemon
        git config --global credential.helper cache
        break
    elif [[ $ans = S ]]; then
        echo Skipping
        break
    else
        echo "Invalid input"
    fi  
done
