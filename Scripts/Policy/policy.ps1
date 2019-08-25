#Get all policy assignment
Get-AzPolicyAssignment

#Get all poilicy definations
Get-AzPolicyDefinition

#Assign policy assignment
$policy_definition = Get-AzPolicyDefinition | ?{$_.Properties.DisplayName -eq "Audit VMs that do not use managed disks"}

$rg = Get-AzResourceGroup -Name policy-rg

New-AzPolicyAssignment -Name "Check if managed disk" -DisplayName "Check if Managed Disk -Raj" -Scope $rg.
ResourceId -PolicyDefinition $policy_definition -Description "This defination is enforced by Raj"

#Remove policy assignment
Remove-AzPolicyAssignment -Id "/subscriptions/c5a29ff8-babb-4c3f-963e-5abcab3fbe9e/providers/Microsoft.Authori
zation/policyAssignments/67366089189140e593e548f6"

#Create policy definations
New-AzPolicyDefinition -Name 'AuditStorageAccounts' -DisplayName 'Audit Storage Accounts Open to Public Networks' -Policy pol-def.txt

#Delete policy definations
Remove-AzPolicyDefinition -Name 'AuditStorageAccounts'

#List all initiative definations
Get-AzPolicySetDefinition

#Get initiative definations with name
$psd = Get-AzPolicySetDefinition | ?{$_.Properties.DisplayName -eq "Audit Windows VMs that are not set to the specified time zone"}
$psd

#Create inititive definations
New-AzPolicySetDefinition -Name 'Raj-PolicySetDefinition' -Metadata '{"catego
ry":"Rajs Category"}' -PolicyDefinition pol-set.json

#Assign inititive definations to subscription
$policy_set_definition = Get-AzPolicySetDefinition | ?{$_.Name -eq "Raj-PolicySetDefinition"}

New-AzPolicyAssignment -Description "Assigning initiative defination" -DisplayName "Assignment from PS" -Metadata '{"category":"Vm Category"}' -Name "Name Assignment from PS" -PolicySetDefinition $policy_set_definition -Scope "/subscriptions/c5a29ff8-babb-4c3f-963e-5abcab3fbe9e/resourceGroups/policy-rg"

#Assign inititive definations to resource group
$policy_set_definition = Get-AzPolicySetDefinition | ?{$_.Name -eq "Raj-PolicySetDefinition"}

New-AzPolicyAssignment -Description "Assigning initiative defination" -DisplayName "Assignment from PS" -Metadata '{"category":"Vm Category"}' -Name "Name Assignment from PS" -PolicySetDefinition $policy_set_definition -Scope "/subscriptions/c5a29ff8-babb-4c3f-963e-5abcab3fbe9e"

#Remove initiative defination assignment
Remove-AzPolicyAssignment -Id "/subscriptions/c5a29ff8-babb-4c3f-963e-5abcab3fbe9e/providers/Microsoft.Authorization/policyAssignments/Name Assignment from PS"

#Delete inititive definations
Remove-AzPolicySetDefinition -Name 'Raj-PolicySetDefinition'