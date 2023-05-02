# FreeRTOSDemo

Created by Espressif Systems, the ESP32 is a low-cost, low-power system on a chip (SoC) series with Wi-Fi & dual-mode Bluetooth capabilities!  
The chip can run FreeRTOS, which is a Realtime Operating System for microcontrollers.  

## Installation of ESP-IDF

ESP-IDF = Espressif IoT Development Framework  
Download esp-idf (https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/index.html#step-1-install-prerequisites) and install.  
Configure IDF_PATH = ~/esp/esp-idf  
ESP-IDF uses a modified version of openocd    
Configure OPENOCD_PATH (see below)

## Steps to create this project

### Setup environment

Do not just copy this, check/change the folder names to the correct folders on your disk!

```commandline
export IDF_PYTHON_ENV_PATH=~/.espressif/python_env/idf4.3_py2.7_env;IDF_PATH=~/tmp/esp-idf;PYTHON=~/.espressif/python_env/idf4.3_py2.7_env/bin/
export PATH=$PATH:~/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin
export OPENOCD_PATH="~/.espressif/tools/openocd-esp32/v0.10.0-esp32-20200709/openocd-esp32"
cd $IDF_PATH
. ./export.sh
```

### Create project

Checkout the demo project
```commandline
git clone https://gitlab.groept.be/ib3/freertosdemo.git
```

Or create your own new project in a separate git repository on gitlab.groept.be
```commandline
cd ~/projects/esp32
idf.py create-project freertosdemo
git init
git remote add origin git@gitlab.groept.be:ib3/team_xx.git
git add .
git commit -m "Initial commit"
git push -u origin master
```

### Configure target and menuconfig

```commandline
idf.py set-target esp32s3
idf.py menuconfig
```
Change parameters in FreeRTOSDemo Configuration (WiFi SSID/Password)

### Configure CLion

Install CLion, best is to do this via the JetBrains Toolbox (https://www.jetbrains.com/toolbox-app/)  
Open Clion  
Open project...  
Select freertosdemo directory  
Install plugin ESP32 via settings/plugins (Ctrl-Alt-S)
(https://github.com/paoloach/ESP32)

Go to Settings... / CMake / Change debug profile    
Change:  
```
CMake Options: -DCMAKE_TOOLCHAIN_FILE=CrossCompiler.cmake  
Add environment: IDF_PATH=~/esp/esp-idf;PATH=~/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin:/usr/bin:/sbin:/bin:/opt/bin  
```
Add Run Configuration...  
```
ESP32 Flash  
Name : Flash  
Configuration : Debug  
Select serial port  
Baud rate: 115200  
```

## Running this project

### Build and Flash

Setup your hardware, connect a LED on pin 4 (don't forget to add a resistor!).  
ySelect the flash Run Configuration and start it.  
This will first build the project and next search for the ESP32 on /dev/ttyUSB0 (change this in your run configuration if necessary) and flash the elf to your ESP32.  

### Connect WiFi and send data

The ESP32 has now created a WiFi Access Point, connect to this access point with your laptop. Default gateway will be 192.168.4.1  
Use telnet or netcat to connect to the socket server on port 3333 running on the ESP32 and send a "TOGGLE" command.  
Use CTRL-D instead of ENTER to send data to the socket. (ENTER would send extra EOL symbols)
```commandline
nc 192.168.4.1 3333
TOGGLE<CTRL-D>
```
Press CTRL-C to exit.  

## Beyond this project

### CMake

ESP-IDF uses CMake to compile projects, this has a specific syntax you will need to learn.  
Adding C-files requires you to add the source to one of the CMakeLists.txt files.  
Look in that file for an example.

### Kconfig

ESP-IDF uses Kconfig files to specify configurable constants.  
These can be configured using idf.py menuconfig.  
Using them in your source code is done through defines.  
Look in this example to see how to do this.  

### Adding a component

When you start developing your project, use components.

```commandline
idf.py create-component mycomponent -C components/mycomponent
```
### More information

General information about the esp32s3: https://docs.espressif.com/projects/esp-idf/en/latest/esp32s3/hw-reference/esp32s3/user-guide-devkitc-1.html#getting-started  
CLion with idf: https://www.jetbrains.com/help/clion/esp-idf.html  
Using the environment script (that is export.sh for idf): https://www.jetbrains.com/help/clion/how-to-create-toolchain-in-clion.html#env-scripts  
Installing idf on linux/macos: https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html  

ESP32 : http://esp32.net/  
ESP-IDF : https://docs.espressif.com/projects/esp-idf/en/latest/esp32/index.html  
FreeRTOS : https://freertos.org/  
ESP32 Huzzah : https://www.adafruit.com/product/3619  
Technical information : https://www.espressif.com/en/products/socs/esp32  
Book : https://leanpub.com/kolban-ESP32  
TRM : https://www.espressif.com/sites/default/files/documentation/esp32_technical_reference_manual_en.pdf  
