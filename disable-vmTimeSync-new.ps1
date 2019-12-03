# The following script accepts input of SingleVM or Cluster Name.  
# These settings disable the time sync to the VMhost . https://kb.vmware.com/s/article/1189


function ClusterVMs ($Cluster,$ExtraValues) {



}

function SingleVM ($SingleVM,$ExtraValues) {



}


################ Script starts here ###############

# Clear Screen
Clear-Host

# Promt User to select Single VM or Cluster Name
write-host "1   Cluster"
Write-host "2   Single VM"

# 1 Blank line
""

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

# Capture response from user
$response = read-host "Please enter 1 or 2"

switch ($response)
{
    "1" {ClusterVMs($ExtraValues)}
    "2" {SingleVM($ExtraValues)}
}