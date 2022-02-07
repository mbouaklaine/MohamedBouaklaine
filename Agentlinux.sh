#!/bin/bash
#pool=${testlinux}
#pat=${khjp73bizufgmvzzm6mh3puieqxztvbpfwkyqy4our5mzzavdw6a}
#azdourl=${https://dev.azure.com/allymeer-hossen/}

# install az cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

#create installation directory
sudo mkdir $(pwd)/myagent
sudo chmod -R o+w $(pwd)/myagent
cd $(pwd)/myagent
#Download and install the agent
sudo wget https://vstsagentpackage.azureedge.net/agent/2.196.2/vsts-agent-linux-x64-2.196.2.tar.gz
sudo tar zxvf *.tar.gz
cd ..
sudo chmod -R o+w $(pwd)/myagent
cd $(pwd)/myagent
./config.sh --unattended --url "https://dev.azure.com/allymeer-hossen/" --auth pat --token "srkne4chzomco2eejelnlsu66er55qpxiyftjb6odnlurvxj554a" --pool "testlinux" --agent $(hostname) --runAsService
sudo ./svc.sh install 
sudo ./svc.sh start 
sudo ./svc.sh status
