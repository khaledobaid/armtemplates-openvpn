New-AzureRmResourceGroupDeployment -Name OpenVPNDepotment -ResourceGroupName OpenVPN `
  -TemplateUri https://raw.githubusercontent.com/khaledobaid/armtemplates-openvpn/master/json/openvpn.json `
  -TemplateParameterUri https://raw.githubusercontent.com/khaledobaid/armtemplates-openvpn/master/json/openvpn.parameters.json