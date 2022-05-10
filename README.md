# USRP_RX_MULTI_RECV
Multi-USRP recv and save to file

# Contents
 * [Description](#description)
 * [Installation](#installation)

# Description
USRP_RX_MULTI_RECV is used to create multi::usrp object of multiple synched SDR to recevive samples to files (metadata + IQ).  

# Installation
### Dependencies:
PLease install UHD [here](https://kb.ettus.com/Building_and_Installing_the_USRP_Open-Source_Toolchain_(UHD_and_GNU_Radio)_on_Linux).

### Clone this repository: 
```sh
$ git clone https://github.com/Shadowcaster77/USRP_RX_MULTI_RECV.git
$ mkdir build
$ cd build
$ cmake ../
$ make
```
