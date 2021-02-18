<#
.SYNOPSIS
Deploy the specified template to the specified resource group
#>
Param
(
    [string] [Parameter(Mandatory=$true)] $TemplateFileLocation,
	[string] [Parameter(Mandatory=$true)] $ParametersFileLocation,
	[hashtable] $Parameters = @{},
	[string] [Parameter(Mandatory=$true)] $ResourceGroupName,
	[string] [Parameter(Mandatory=$true)] $SubscriptionName,
	[string] [Parameter(Mandatory=$true)] $Location,
	[string] [Parameter(Mandatory=$true)] $DeploymentName
)

Set-AzContext -Subscription $SubscriptionName

$rg = Get-AzResourceGroup -Name $ResourceGroupName -Location $Location
if($rg -eq $null)
{
	throw "Resource group $resourceGroupName does not exist"
}

New-AzResourceGroupDeployment `
	-Name $DeploymentName `
	-ResourceGroupName $ResourceGroupName `
	-TemplateFile $TemplateFileLocation `
	-TemplateParameterFile $ParametersFileLocation `
	@Parameters `
	-Mode Incremental `
	-DeploymentDebugLogLevel All `
	-WhatIf