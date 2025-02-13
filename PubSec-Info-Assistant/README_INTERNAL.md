## Deploying
Run 
```bash
make deploy
```

Once the command has finished running, go into Azure Portal and click `Resources Groups`. Find the resource group that you just deployed, probably called `infoasst-myworkspace`, or `infoasst-*`, and click it.  Now navigate to the resource `infoasst-web-*`, whatever it is called. Then in the left pane click `Authentication`. In the list of Identity providers press the one called `infoasst_web_access_*`. Now click the link which is next to `Managed application in ...`. In the left pane now, press `Users and Groups`. Click `Add user/group`. Click `None Selected`. Checkmark those that should have access - probably the group's members. Click `Select` then `Assign`. Now navigate back to the webapp-resource, called `infoasst-web-*`. Click the `Default Domain`-link. And this should take you, after having logged in, to the chatbot!

For a more visual guide of this, see: https://mslearn.cloudguides.com/guides/Deploy%20the%20Information%20Assistant%20accelerator

Be warned: Deploying can take up to 30 minutes!

## Deleting the resources

This is quite an expensive deployment, so be mindful that you delete the resources once you are finished working. In order to do this, go into the Azure Portal and navigate to `Resource Groups`. Find the resource group that was deployed, probably called `infoasst_myworkspace`, click it and press delete resource group. Follow through. The second step is to search for `Azure OpenAI` in the search bar. Then press `Manage deleted resources` and `Purge` whatever deleted resources there are there. Final step is to `Stop` the Azure VM that you are deploying from. 

## Redeploying after deleting
Often you will want to deploy some version of the repository, then delete the deployment, change some code and redeploy. However, it can take quite some minutes to delete all the resources, and if you try to redeploy during the deletion period, you get errors. A workaround for this is to change the name of the `WORKSPACE`-variable in the `local.env`-file, for example from `myworkspace1` to `myworkspace2`. Thus the redeployment will not conflict with the workspace that is being deleted. 

If you get errors like these: 
```bash
Error: Key Vault (Subscription: "a3adf20e-4966-4afb-b717-4de1baae6db1"
│ Resource Group Name: "infoasst-myworkspace"
│ Key Vault Name: "infoasst-kv-bsmwy") was not found
│ 
│   with module.enrichmentApp.data.azurerm_key_vault.existing,
│   on core/host/enrichmentapp/enrichmentapp.tf line 249, in data "azurerm_key_vault" "existing":
│  249: data "azurerm_key_vault" "existing" {
│ 
╵
╷
│ Error: Key Vault (Subscription: "a3adf20e-4966-4afb-b717-4de1baae6db1"
│ Resource Group Name: "infoasst-myworkspace"
│ Key Vault Name: "infoasst-kv-bsmwy") was not found
│ 
│   with module.functions.data.azurerm_key_vault.existing,
│   on core/host/functions/functions.tf line 75, in data "azurerm_key_vault" "existing":
│   75: data "azurerm_key_vault" "existing" {
│ 
╵
╷
│ Error: Storage Account (Subscription: "a3adf20e-4966-4afb-b717-4de1baae6db1"
│ Resource Group Name: "infoasst-myworkspace"
│ Storage Account Name: "infoasststorebsmwy") was not found
│ 
│   with module.functions.data.azurerm_storage_account.existing_sa,
│   on core/host/functions/functions.tf line 80, in data "azurerm_storage_account" "existing_sa":
│   80: data "azurerm_storage_account" "existing_sa" {
│ 
╵
make: *** [Makefile:22: infrastructure] Error 1
```
It is due to resources not being fully deleted. The fix is simply to make a small modification to the `WORKSPACE`-variable in the `local.env`-file.

## Some setup information

Packages that should be installed (not an exhaustive list):
figlet, jq, terraform, azure cli, npm, skopeo, docker

```bash
sudo apt-get update
sudo apt-get install -y skopeo
```

Really had some trouble with Skopeo and Docker compatibility. Skopeo 1.4.1 and Docker 24.0.7 are compatibile and will run. I don't remember all the commands I ran, but this one among the commands for Docker: 
```bash
sudo apt-get install -y \
  docker-ce=5:24.0.7-1~ubuntu.22.04~jammy \
  docker-ce-cli=5:24.0.7-1~ubuntu.22.04~jammy \
  containerd.io
```

Recreating, I think this is the sequence of commands to get the rights Docker installation: 
First remove Old Docker Packages and ProjectAtomic PPA. Search for and remove any references to the deprecated ProjectAtomic PPA.
Purge any existing Docker packages (e.g., docker-ce, docker-ce-cli, docker.io, etc.) and run sudo apt autoremove.
Then do this: 

```bash
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo tee /etc/apt/keyrings/docker.gpg > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
Add the Docker Repository for Ubuntu 22.04
```
```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
Install Docker 24.0.7 Explicitly
Use the version string from apt-cache madison docker-ce and pin it:
```
```bash
sudo apt-get install -y \
  docker-ce=5:24.0.7-1~ubuntu.22.04~jammy \
  docker-ce-cli=5:24.0.7-1~ubuntu.22.04~jammy \
  containerd.io
Verify Installation
```
```bash
docker --version
# => Docker version 24.0.7, build ...
sudo docker run hello-world
```