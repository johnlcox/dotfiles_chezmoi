$zulu_versions = @(
    "zulu11"
    "zulu17"
)

choco upgrade -y $zulu_versions

if (Test-Path -Path "$HOME\.jenv") {
    $env:Path += ";$HOME\.jenv"

    # jenv uses Write-Host so redirect that to success to capture the output
    $existing_jenvs = jenv list 6>&1 | Out-String
    foreach ($zulu_version in $zulu_versions) {
        if ($existing_jenvs -like "*${zulu_version}*") {
            continue
        }

        $jdk_dir = $zulu_version.Insert(4, '-')
        $jdk_path = "C:\Program Files\Zulu\${jdk_dir}"
        # echo $jdk_path
        jenv add $zulu_version $jdk_path
    }
}