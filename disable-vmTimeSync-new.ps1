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

# Capture response from user
$response = read-host "Enter 1 or 2"

switch ($response)
{
    "1" {}
}