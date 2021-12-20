Once the gitpod is loaded. Get to the correct area and try this line with the apporpriate file


```

echo -n "const " > fw.h && xxd -i v0.4.0-send-ok-E.ino.dfu >> fw.h

```

then th fw.h file can be inserted with changed labels  top and bottom with this MRKWAN file 

https://github.com/arduino-libraries/MKRWAN/blob/master/examples/MKRWANFWUpdate_standalone/MKRWANFWUpdate_standalone.ino


actual file to change is this 

https://github.com/arduino-libraries/MKRWAN/blob/master/examples/MKRWANFWUpdate_standalone/fw.h


note file name and length at the bottom must be kept the same

