$copy_c  = '..\Gridania-Realtime\src\src'
$paste_c = '..\Gridania_RealTime118\System\StateManagement\src'
$copy_h  = '..\Gridania-Realtime\src\inc'
$paste_h = '..\Gridania_RealTime118\System\StateManagement\inc'


# function print {

#     process {}



if ($copy_c -AND $paste_c) {

    Write-Host -Object 'Source: ' -NoNewline
    Write-Output $copy_c
    Write-Host -Object 'Destination: ' -NoNewline
    Write-Output $paste_c
    $confirmation = Read-Host  'Continue with path? [Y]/[N]'


    if ($confirmation -eq 'y') {
        Remove-Item $paste_c -Recurse
        Write-Host -Object 'Removed' -NoNewline
        Write-Output $paste_c
        
        Remove-Item $paste_h -Recurse
        Write-Host -Object 'Removed' -NoNewline
        Write-Output $paste_h
        
        Copy-Item -Path $copy_c -Destination $paste_c -Recurse
        Copy-Item -Path $copy_h -Destination $paste_h -Recurse
        #replace $copy_c $paste_c /s
        #replace $copy_h $paste_h /s
    }


}


else {
    $copy_file = Read-Host -Prompt 'Input Source'
    $paste_file = Read-Host -Prompt 'Input Destination'
    replace $copy_file $paste_file /s
}

