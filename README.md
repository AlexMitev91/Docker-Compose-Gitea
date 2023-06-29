# Automated provisioning of Gitea instance with Vagrant (VB)

You can deploy and launch the Gitea instanace by simply executing vagrant up, which will bring a Debian11 VB machine, install Docker and launches a gitea:1.16.0 and mysql:8 containers. It's quite easy and useful in case you need a Git sandbox to playaround and test webhooks, or perform some Git related tasks using virtual machines that don't have a public IP.

Here are a few lines that you'll need to customize for yourself:

setup_gitea.sh

Line 11: The script creates a user, which by default is "--username alex --password password1 --email alex@gitea.lab".

Line 18-28: The script clones a piblic Git repository to a temp folder, then pushes the repo to Gitea. On Line 22 you can change the link of the public repository to be cloned, and on Line 28 you can change the name of the repository to be created in Gitea.

Gitea URL: http://192.168.111.202:3000/
