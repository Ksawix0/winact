echo "---------------------"
echo "Windows 11 Activation"
echo "---------------------"
echo ""
$winwer = (Get-WmiObject -class Win32_OperatingSystem).Caption
echo "Windows version: $winwer"
echo ""
echo "Executing: slmgr /ipk {Key to your version of win}"
echo ""

if($winwer -eq "Microsoft Windows 11 Pro"){
    slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
}
elseif($winwer -eq "Microsoft Windows 11 Pro N"){
    slmgr /ipk MH37W-N47XK-V7XM9-C7227-GCQG9
}
elseif($winwer -eq "Microsoft Windows 11 Home"){
    slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
}
elseif($winwer -eq "Microsoft Windows 11 Home N"){
    slmgr /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM
}
elseif($winwer -eq "Microsoft Windows 11 Enterprise"){
    slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
}
elseif($winwer -eq "Microsoft Windows 11 Enterprise N"){
    slmgr /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
}
else{
    if(([Security.Principal.WindowsIdentity]::GetCurrent()).Owner.Value -ne "S-1-5-32-544"){
        echo "need elevatged permisions"
    }
    else{
        echo "Idk win ver or it's not supported by this script"	
    }
    read-host “Press ENTER to continue...”
exit
}

echo "Executing slmgr /skms kms8.msguides.com"
echo ""
slmgr /skms kms8.msguides.com

$succes = 0
while($succes -eq 0){
    echo "Executing slmgr /ato"
    slmgr /ato
    $conf = Read-Host "Activation was succesful? Y or N:"
    if($conf -eq "Y" -or $conf -eq ""){
    $succes = 1
    }
}