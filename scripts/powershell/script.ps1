
## Get all orgs
sfdx force:org:list --verbose

# See default settings for project
sfdx  config:list

# It is considering the current org as the devhub org
sfdx auth:web:login -d -a DevHub   

# Logging out of specific org
sfdx auth:logout --targetusername my-hub-org

# Setting Devhub
sfdx force:config:set defaultdevhubusername=me@myhub.org

# opening scratch org
sfdx force:org:open -u MyTP1Scratch

# Configurar ORG DEVHUB
sfdx config:list

# For Testing
sfdx force:apex:test:run --testlevel RunAllTestsInOrg --wait 1000 --resultformat human

# Delete Scratch org
sfdx force:org:delete --targetusername --noprompt

#
sfdx force:data:soql:query --query "SELECT Id,ParentId,Description,(SELECT Id,Name,Description FROM ChildAccounts) FROM Account" --json


#To show all live debugs 
sfdx force:apex:log:tail --color | Select-String -Pattern USER_DEBUG,EXCEPTION,THROW

# Ctrl C to stop session



sfdx force:data:soql:query --query "SELECT Id, ParentId, Parent.ParentId, Parent.Parent.ParentIdParent.Parent.Parent.ParentIdParent.Parent.Parent.Parent.ParentIdParent.Parent.Parent.Parent.Parent.ParentIdParent.Parent.Parent.Parent.Parent.Parent.ParentIdParent.Parent.Parent.Parent.Parent.Parent.Parent.ParentIdParent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.ParentIdParent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.ParentIdParent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.ParentId FROM Account WHERE Id=''" --json


# Link to the SFDX Project with the playground

sfdx force:auth:web:login --setalias MyTPforSuperbadgeLexRD --setdefaultdevhubusername


# Create a Scratch

sfdx force:org:create -s -f config/project-scratch-def.json -a MyScratchOrgSuperbadgeLexRD

sfdx force:org:create --setdefaultusername --definitionfile config/project-scratch-def.json

# Push all source from force-app

sfdx force:source:push

# Git hub Repository

git version
git config --global user.email "alexanderworld91211@gmail.com"
git config --global user.name "AlexMigNar"
git init
git remote add origin https://github.com/AlexMigNar/AccountHierarchy
git commit -m "my commit”
git add .
git push -f origin master


# Log in to your Devhub
sfdx auth:web:login --setdefaultdevhubusername --setalias DevHub

# Debug Log

sfdx force:apex:log:tail --color 

# Git Commands

git branch
git push
git merge

