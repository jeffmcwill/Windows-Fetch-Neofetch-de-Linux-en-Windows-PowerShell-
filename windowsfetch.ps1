#script tipo neofetch para saber datos de nuestra pc con powershell.
#sencillo de usar y se puede ejecutar en cualquier lugar y se cierra presionando 1.

function datos(){

#comando que da nombre actual del usuario.

    $nombre = $env:username

#comando para obtener el sistema operativo actual

    $os1 = (Get-CimInstance Win32_OperatingSystem).Caption

#version del powershell actual

    $ho1 = (Get-Host).Version

#modelo de la maquina ejecutandose    

    $mod = [system.environment]::MachineName

#arquitectura del sistema actual 32 o 64 bits

    $arq = (gwmi win32_computersystem).SystemType

#fecha del sistema operativo

    $tiem = Get-Date

#resolucion actual del pc

    $reso = (Get-WmiObject win32_VideoController).VideoModeDescription

#nombre del cpu    

    $cpu = (Get-CimInstance Win32_Processor).Name

#nombre de la tarjeta de video    

    $gpu = (Get-WmiObject win32_VideoController).Name

#tamaño de memoria actual y maximo. 
   
    $memo = (gwmi Win32_ComputerSystem).TotalPhysicalMemory
    write-host "-------------------------------------------------------------------------------------"
    write-host "
                                        
                            .oodMMMM    
                   .oodMMMMMMMMMMMMM    Usuario : $nombre
       ..oodMMM  MMMMMMMMMMMMMMMMMMM    ---------------
 oodMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM    OS: $os1 / $arq 
 MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM    Modelo: $mod
 MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM    Tiempo: $tiem 
 MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM    Resolucion: $reso
 MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM    Version Power: $ho1
 MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM    CPU: $cpu
                                        GPU: $gpu 
 MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM    Memoria: $memo
 MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
 MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
 MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
 MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM
  `^^^^^^MMMMMMM  MMMMMMMMMMMMMMMMMMM
         ````^^^^  ^^MMMMMMMMMMMMMMMMM
                        ````^^^^^^MMMM "

try{
    do{
        write-host ""
        write-host ""
        write-host "-------------------------------------------------------------------------------------"
        write-host "Para salir presiona 1"

        $user1 = read-host ">> "
        switch($user1)
        {
            {$_ -eq 1}{
                write-host "Gracias por usar este script. Jeff McWill."
                break
            }
        }

}until($user1 -eq 1)
}catch{
    Write-Warning "Caracteres no validos, agrega los soportados por el programa."
}
}

#funcion principal al ejecutarse:
datos