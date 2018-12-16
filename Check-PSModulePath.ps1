function Get-UserModulePath {
    if($IsMacOS -or $IsLinux){
        $delim = ":"
        $user = $env:USER
    }
    if($IsWindows){
        $delim = ";"
        $user = $env:USERNAME
    }

    $Path = $env:PSModulePath -split $delim -match $user
    $Path = $Path -notmatch "vscode"

    if (-not (Test-Path -Path $Path))
    {
        New-Item -Path $Path -ItemType Container | Out-Null
    }
        $Path
}
 
Invoke-Item (Get-UserModulePath)
# Get-UserModulePath