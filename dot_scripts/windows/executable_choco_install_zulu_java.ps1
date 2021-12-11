# Create an associative array of the common jdk version keys to brew package names
$zulu_versions = @{
    jdk11="zulu11";
    jdk17="zulu17"
}


$versions_to_install=@()
foreach ($jdk_version in $args) {
    $versions_to_install += $zulu_versions[$jdk_version]
}


choco upgrade -y $versions_to_install

if (Test-Path -Path "$HOME\.jenv") {
    $env:Path += ";$HOME\.jenv"

    # jenv uses Write-Host so redirect that to success to capture the output
    $existing_jenvs = jenv list 6>&1 | Out-String
    foreach ($zulu_version in $versions_to_install) {
        if ($existing_jenvs -like "*${zulu_version}*") {
            continue
        }

        $jdk_dir = $zulu_version.Insert(4, '-')
        $jdk_path = "C:\Program Files\Zulu\${jdk_dir}"
        # echo $jdk_path
        jenv add $zulu_version $jdk_path
    }
}