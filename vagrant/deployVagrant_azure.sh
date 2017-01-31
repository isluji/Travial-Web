
# Get env vars needed to connect to Azure
source private/azure_env_vars.sh

# Launch Vagrant with Azure provider
vagrant up --provider=azure
