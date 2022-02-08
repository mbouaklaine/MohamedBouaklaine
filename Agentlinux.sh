#!/bin/bash
#$agentuser=${azureuser}
pool="testlinux"
pat="srkne4chzomco2eejelnlsu66er55qpxiyftjb6odnlurvxj554a"
azdourl="https://dev.azure.com/allymeer-hossen/"

# install az cli
wget https://aka.ms/InstallAzureCLIDeb | sudo bash

# download azdo agent
sudo mkdir $(pwd)/myagent
cd $(pwd)/myagent
wget https://vstsagentpackage.azureedge.net/agent/2.196.2/vsts-agent-linux-x64-2.196.2.tar.gz  # Newer versions may be available at the time you're reading this
tar xzvf *.tar.gz

# configure as azdouser
cd ..
sudo chmod -R o+w $(pwd)/myagent
cd $(pwd)/myagent
./config.sh --unattended --url $3 --auth pat --token $2 --pool $1 --agent $(hostname) --runAsService

# install and start the service
sudo ./svc.sh install 
sudo ./svc.sh start 
sudo ./svc.sh status
