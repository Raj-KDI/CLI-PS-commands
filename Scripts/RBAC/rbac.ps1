#Get all RBAC definitions
Get-AzRoleDefinition

#Assign a RBAC to a user in a subscription
New-AzRoleAssignment -RoleDefinitionName Owner -Scope "/subscriptions/c5a29ff8-babb-4c3f-963e-5abcab3fbe9e" -SignInName sushmita.murmu@rajkmarandi.co.in

#Remove a RBAC to subscription
Remove-AzRoleAssignment -Scope "/subscriptions/c5a29ff8-babb-4c3f-963e-5abcab3fbe9e" -RoleDefinitionName Owner -SignInName sushmita.murmu@rajkmarandi.co.in -Confirm

#Assign a RBAC to resource group
New-AzRoleAssignment -ResourceGroupName az203rg -SignInName sushmita.murmu@rajkmarandi.co.in -RoleDefinitionName Owner

#Remove a RBAC to resource group
Remove-AzRoleAssignment -ResourceGroupName az203rg -RoleDefinitionName Owner -SignInName sushmita.murmu@rajkmarandi.co.in -Confirm

#Assign a RBAC to aad group in a subscription
New-AzRoleAssignment -RoleDefinitionName Owner -Scope "/subscriptions/c5a29ff8-babb-4c3f-963e-5abcab3fbe9e" -ObjectId 02754431-edce-4d81-93da-caa537fae317

#Remove a RBAC to resource group
Remove-AzRoleAssignment -scope "/subscriptions/c5a29ff8-babb-4c3f-963e-5abcab3fbe9e" -ObjectId 02754431-edce-4d81-93da-caa537fae317 -RoleDefinitionName Owner -Confirm

#Create custom RBAC.
New-AzRoleDefinition -InputFile custom-rbac-rule.json

#Assign custom RBAC to resource group
New-AzRoleAssignment -ResourceGroupName az203rg -SignInName sushmita.murmu@rajkmarandi.co.in -RoleDefinitionName "Custom Role By Raj"

#Remove custom RBAC from resource group (-confirm will ask for yes/no  before executing the command)
Remove-AzRoleAssignment -ResourceGroupName az203rg -SignInName sushmita.murmu@rajkmarandi.co.in -RoleDefinitionName "Custom Role By Raj" -Confirm

#Delete custome RBAC from system (Make sure to delete all assignments before deleting the definations)
Remove-AzRoleDefinition -Name "Custom Role By Raj"