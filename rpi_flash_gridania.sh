#!/bin/bash

# add 118 srec directory
dir_118="/a/gitclone/Gridania_RealTime118/GCC/release/gridania-realtime.srec"
dir_148="/a/gitclone/Gridania_Telematic148/Release-App/TelematicECU.srec"

# add rpi address
rpi_add="pi@raspberrypi-"


# Parse command line options
while getopts "r:e:" opt; do
  case $opt in
    r)
      rpi_version=$OPTARG
      ;;
    e)
      ecu=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done


# Check if the host option was specified
if [ -z "$rpi_version" ]; then
  echo "Error: Enter RPI number with argument -r (either 7 or 75)" >&2
  exit 1
fi

# Check if the username option was specified
if [ -z "$ecu" ]; then
  echo "Error: Enter ECU to update with argument -e (either 118 or 148)" >&2
  exit 1
fi

###Flash sequence starts here
##update 118 on Gridania

if [ $ecu == "118" ]; then

#copy file to RPI
    scp $dir_118 $rpi_add$rpi_version.local:~/openblt/Host/

#connect to RPI
#RPI commands in EOF marker
    ssh $rpi_add$rpi_version.local <<EOF
      cd ~/openblt/Host/
      ./BootCommander -s=xcp -t=xcp_can -d=can1 -b=250000 -tid=118 -xid=1 -t1=1000 -t3=2000 -t4=10000 -t5=1000 -t7=2000 gridania-realtime.srec
EOF
  exit 1
fi


##update 148 on Gridania
if [ $ecu == "148" ]; then

#copy file to RPI
    scp $dir_148 $rpi_add$rpi_version.local:~/openblt/Host/

#connect to RPI
#RPI commands in EOF marker
    ssh $rpi_add$rpi_version.local <<EOF
      cd ~/openblt/Host/
      ./BootCommander -s=xcp -t=xcp_can -d=can1 -b=250000 -tid=148 -xid=1 -t1=1000 -t3=2000 -t4=10000 -t5=1000 -t7=2000 TelematicECU.srec
EOF
    exit 1
fi






