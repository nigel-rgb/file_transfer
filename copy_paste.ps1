$copy_file  = '.\Gridania-Realtime\src\*'
$paste_file = '.\Gridania_RealTime118\System\StateManagement\'


# function print {

#     process {}
# }


if ($copy_file -AND $paste_file) {

    Write-Host -Object 'Source: ' -NoNewline
    Write-Output $copy_file
    Write-Host -Object 'Destination: ' -NoNewline
    Write-Output $paste_file
    $confirmation = Read-Host  'Continue with path? [Y]/[N]'

    if ($confirmation -eq 'y') {
        replace $copy_file $paste_file /s
    }


}


else {
    $copy_file = Read-Host -Prompt 'Input Source'
    $paste_file = Read-Host -Prompt 'Input Destination'
    replace $copy_file $paste_file /s
}

