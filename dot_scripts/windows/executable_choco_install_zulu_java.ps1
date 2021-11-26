$zulu_versions = @(
    "zulu11"
    "zulu17"
)

choco install $zulu_versions

if (Test-Path -Path "$HOME/.jenv") {
    $env:Path += ";$HOME/.jenv"

    foreach ( $zulu_version in $zulu_versions ) {
        $jdk_dir = $zulu_version.Insert(4, '-')
        $jdk_path = "C:\Program Files\Zulu\${jdk_dir}"
        echo $jdk_path
        jenv add $zulu_version $jdk_path
    }
}