#Get all the tags in the subscription
Get-AzTag

# Assign resource group a tag inline
Set-AzResourceGroup -Name azfromcli -Tag @{Owner="Raj Kishore Marandi"}

# Assign resource group another tag.
$tag = @{ProjectId="111-222-333"}
$VM = Get-AzResource -ResourceGroupName azfromcli -Name testvm					  
Set-AzResource -ResourceId $vm.Id -Tag $tag -Force

#Get all the tags in a resource group
(Get-AzResource -ResourceGroupName RG-CLI).Tags

#Get all resource assigned by a tag id
Get-AzResource  -TagName "ProjectId"

#Get all resource name by a tag id
(Get-AzResource  -Tag @{ProjectId="111-222-333"}).Name

#Get all the tags from a resource
(Get-AzResource -ResourceType Microsoft.Compute/virtualMachines).Tags

#Append tags to a resource group
$tags = (Get-AzResourceGroup -Name azfromcli).Tags
$tags.Add("ProjectId","555-666-777") #or $tags += @{ProjectId ="555-666-777"; LifeCyclePhase = "Testing"}
Set-AzResourceGroup -name azfromcli -Tag $tags

#Append tags to a VM
$tags = (Get-AzResource -ResourceGroupName azfromcli -Name ).Tags
$tags.Add("ProjectId","999-000-111")
Set-AzResource -ResourceGroupName azfromcli `
               -ResourceName testvm `
               -ResourceType Microsoft.Compute/virtualMachines `
               -Tag $tags `
               -Force

#Append tags to a VM another way
$tags = (Get-AzResource -ResourceGroupName azfromcli -Name testvm).Tags
$tags.Add("ProjectId","444-333-555")
$Resource = Get-AzResource -Name azfromcli
Set-AzResource -ResourceId $resource.Id -Tag $tags -Force
			   
#Delete all assigned tags from RG
Set-AzResourceGroup -Name azfromcli -Tag @{}

#Delete all assigned tags from a vm					
$Resource = Get-AzResource -Name testvm
Set-AzResource -ResourceId $resource.Id -Tag @{} -Force