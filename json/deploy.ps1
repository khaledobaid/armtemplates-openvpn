# Deploy Basic Virtual Machine To Windows Azure
CLS

Write-Host 'This powershell will be used to create a OpenVPN VM in microsoft windows azure. You have to enter your credentials to start using it.'
Write-Host 'Virtual Machine Configuration will be through ARM Template vmsettings.json' -ForegroundColor Yellow


$loginCredentials = az account list


if($loginCredentials -eq "[]")
{
    az login
}
else
{
    $login = "true"
}


try
{
    if($login)
    {
   
        Write-Host 'Logged In Successfully' -ForegroundColor Green
        $resourceGroupName = 'OpenVPN'

        $isResourceGroup = az group exists --name $resourceGroupName


        if($isResourceGroup -eq $true)
        {
            $resourceGroup = az group show -n $resourceGroupName
        }
        else
        {
            $resourceGroupLocation = Read-Host 'Enter Resource Group Location'   
            $resourceGroup = az group create --name $resourceGroupName --location $resourceGroupLocation
        }
                      

        if($resourceGroup)
        {
            Write-Host "Resource Group Is Ready" -ForegroundColor Green

            $templateUri = https://raw.githubusercontent.com/khaledobaid/armtemplates-openvpn/master/json/openvpn.json
            $parametersUri = https://raw.githubusercontent.com/khaledobaid/armtemplates-openvpn/master/json/openvpn.parameters.json
            

            az group deployment create --name "OpenVPNDeployment" --resource-group $resourceGroupName --template-uri $templateUri --parameters "openvpn.parameters.json"

            
        }
        else
        {
            Write-Host "Invalid Resource Group" -ForegroundColor Red
        }
   
    }
}
catch
{
    
}

