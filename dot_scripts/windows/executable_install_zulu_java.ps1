@REM TODO: Download msi

$zulu_installers = @(
    "zulu11.52.13-ca-jdk11.0.13-win_x64.msi"
    "zulu17.30.15-ca-jdk17.0.1-win_x64.msi"
)

foreach ( $zulu_installer in $zulu_installers )
{
    $file = $zulu_installer
    $link = "https://cdn.azul.com/zulu/bin/$file"
    $soft_name = ($file).Split('.')[0]

    $find = Get-WmiObject -Class Win32_Product -Filter "Name LIKE `'$soft_name`%'"

    if ($find -eq $null) {

        $tmp = "$env:TEMP\$file"
        $client = New-Object System.Net.WebClient
        $client.DownloadFile($link, $tmp)

        # TODO: Set ADDLOCAL features - ADDLOCAL=<feature1>,...,<featureN>
        msiexec /i $tmp /qn
        del $tmp
        echo "Tried installing $soft_name"
    }
}

exit 0

# Example from https://stackoverflow.com/questions/44336010/downloading-and-installing-msi-from-sharefile

# $file = 'HipChat-4.29.5.1662-win32.msi'
# $link = "https://s3.amazonaws.com/hipchat-ops/hipchat4/windows/$file"
# $soft_name = 'Hipchat'

# $find = Get-WmiObject -Class Win32_Product -Filter "Name LIKE `'$soft_name`%'"

# if ($find -eq $null) {

#     $tmp = "$env:TEMP\$file"
#     # TODO: Set ADDLOCAL features
#     $client = New-Object System.Net.WebClient ADDLOCAL=<feature1>,...,<featureN>
#     $client.DownloadFile($link, $tmp)

#     msiexec /i $tmp /qn
#     del $tmp
#     echo "Tried installing $soft_name"
# } else {
#     echo "ERROR: $soft_name is already installed."
#     echo $find
#     exit 1
# }

# exit 0