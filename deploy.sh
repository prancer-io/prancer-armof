rg_name="armtemp_test_rg"
location="eastus2"
template_file="deploy.json"
parameter_file="parameters.json"
folder_name="storage"

temp_path=$folder_name/$template_file
par_path=$folder_name/$parameter_file

#create the resource group
az group create --name $rg_name --location $location


#deployment
az deployment group create \
  --name ARMDeployment \
  --resource-group $rg_name \
  --template-file $temp_path \
  --parameters $par_path

#delete the resource group
az group delete -n $rg_name --yes