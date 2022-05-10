# USRP_RX_MULTI_RECV
Multi-USRP recv and save to file

# Contents
 * [Description](#description)
 * [Installation](#installation)
 * [Post-Processing](#Post-Processing)

# Description
USRP_RX_MULTI_RECV is used to create multi::usrp object of multiple synched SDR to recevive samples to files (metadata + IQ).  

# Installation
### Dependencies:
PLease install UHD [here](https://kb.ettus.com/Building_and_Installing_the_USRP_Open-Source_Toolchain_(UHD_and_GNU_Radio)_on_Linux).

### Clone and install this repository: 
```sh
$ git clone https://github.com/Shadowcaster77/USRP_RX_MULTI_RECV.git
$ mkdir build
$ cd build
$ cmake ../
$ make
```
### Running Example:
To check parameters that can be specified:
```sh
./rx_multi_receive --help
```
Example: 
```sh
./rx_multi_receive --nsamps 1024 --rate 5e6 --args="addr0=10.10.23.2,addr1=10.10.23.3, … addr7=10.10.24.2" --subdev "A:0 B:0" --channels "0, 1, ... , 14, 15" --prefix "x310_`$now`_"  --sync "pps" --secs 5
```
# Post-Processing
The program saves two files each run: metadata + IQ_binary files. 
To check information of Metadata:
```sh
more <metadata file name>
```
To have a quick view of binary file:
```sh
hexdump -v -e '"%010_ad [" 2/4 " %f " " ]\n"' <binary file name>
```
MATLAB post-processing is also being attached in the MATLAB_PostProcess folder, which the input file names is being hard-coded in the probram, users might need to make changes correspondingly on that. 
For example in plot_w_delay.m:

```sh
fileID = fopen('file name');
A = fread(fileID, 'float');
areal = A([1:2:length(A)]);
aimg  = A([2:2:length(A)]);
```
