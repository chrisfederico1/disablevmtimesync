# Create a hash table for advanced settings

$Cluster = read-host 'Input Cluster Name'

Write-host "Warning : You are about to add advanced Time Sync Settings to all VMs in the following Cluster: $Cluster" -BackgroundColor Red

$reply = read-host "Continue?[y/n]"
if ($reply -match "[nN]")
{
	exit 
}


# Creating a hash table with key-values for the timesync advanced settings

$ExtraValues = @{
	"tools.syncTime"="0";
	"time.synchronize.continue"= "0";
	"time.synchronize.restore"= "0";
	"time.synchronize.resume.disk"= "0";
	"time.synchronize.shrink"= "0";
	"time.synchronize.tools.startup"= "0";
	"time.synchronize.tools.enable"= "0";
    "time.synchronize.resume.host"= "0" 
}

# Get vms in Cluster 
$vmlist = get-cluster -Name $Cluster | get-vm

foreach ($vm in $vmlist)
{
$vmview = get-view -ViewType VirtualMachine -Filter @{"Name" = $vm.Name} #| where-object {-not $_.config.template}
#$vmview = get-view -ViewType VirtualMachine -Filter @{"Name" = "D1WFSERVMGT01"} #| where-object {-not $_.config.template}
$vmConfigSpec = new-object VMware.Vim.VirtualMachineConfigSpec

# Gathering settings and prepare for adding it to virtual machine settings

$ExtraValues | ForEach-Object GetEnumerator | ForEach-Object {
	$extra = New-object VMware.Vim.OptionValue
	$extra.key = $_.key
	$extra.value=$_.value
	$vmConfigSpec.ExtraConfig += $extra
}
	# Performing commit to Virtual Machine.
	write-host "Reconfiguring " $vm.Name
	$vmview.ReconfigVM($vmConfigSpec)

}

