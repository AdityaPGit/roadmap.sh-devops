# Static Site Server

Deploying a custom website using nginx web server on a EC2 instance and using rsync to sync the local and EC2's website directory

## Step 1 | EC2 

1. Create the EC2 instance.

2. Create keypairs, download the .pem file and store it in a secure location on your machine.

3. Launch the instance.

4. Allocate and associate an elastic ip to the EC2 instance.

5. Add the EC2 in the config file in the `~/.ssh` directory. Let's consider the saved hostname as 'roadmapsh'. (for remote hostname, use the elastic ip which we associated to the instance in the previous stage)

6. Open the terminal and use `ssh roadmapsh` to ssh into your EC2.

*Detailed guide of configuring an EC2 instance can be found [here](/ssh-remote-server-setup/Readme.md)*

## Step 2 | NGINX

1.  Install nginx: `sudo apt install nginx`

2. Enable nginx: `sudo systemctl enable nginx` this will enable nginx to start automatically on the machine's startup

3. Now go to your EC2 instance's public ip address (or associated elastic ip address) and see if the default nginx page is visible

4. Now make a directory of your liking. For this project, we'll make a directory in the root folder using `sudo mkdir /srv/roadmapsh/html`

5. Change ownership of this directory to the currently logged in user: `chown -R $(whoami) /srv`

6. Now, go to the server block located in the `default` file in the  `/etc/nginx/sites-enabled/default` using `sudo nano /etc/nginx/sites-enabled/default` 

7. Find the server block with the server name `default_server` and change it's root to your own directory. The edited line should look something like this: `root /srv/roadmapsh/html`

- You can create a new file rather than editing the  default file. But this approach is much easier to configure  a single page website

8. Come to your local machine, and make a file `deploy.sh` and give permissions to execute `deploy.sh` using `chmod +x deploy.sh`

9. Before writing deploy.sh, we need to create our dummy website and place it in a desired folder. Use [my dummy website](/static-site-server/nginxlocal/) to save some time

10. Use the following code and replace necessary file locations:

```
HostConfig='roadmapsh' # Replace this for your custom name if you desire
LocalLocation='location of the website files'
RemoteLocation='location of the folder on the EC2 /src/roadmapsh/html in our case'

rsync -av --delete $LocalLocation $HostConfig:$RemoteLocation
```

11. Execute the script using `./deploy.sh`

12. Switch to your EC2 and reload nginx using `sudo systemctl reload nginx`

#### Now you should see your custom made website by visiting your instance's public ip. Good Luck!