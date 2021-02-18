#Connect-AzAccount
Set-AzContext -Subscription "tdtempos"

# Environment Settings
$subscriptionName = "tdtempos"
$resourceGroupName = "ak-rg-enbops-dev-cac"
$deploymentName = 'opsinfradeployment'
$templateFile = "$PSSCriptRoot\OPSInfra\OPSInfra.Windows.Template.json"
$parametersFile = "$PSSCriptRoot\OPSInfra\OPSInfra.Windows.DEV.Parameters.json"
$location = "canadacentral"

# Deploy the template
& $PSScriptRoot\DeployTemplate.ps1 `
-TemplateFileLocation $templateFile `
-ParametersFileLocation $parametersFile `
-Parameters @{} `
-ResourceGroupName $resourceGroupName `
-SubscriptionName $subscriptionName `
-DeploymentName $deploymentName `
-Location $Location