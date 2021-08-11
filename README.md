# Gitpod-auto-tensorflowJS-to-arduino

better information in the README.mdf file in the myFolder directory


Load this live with Gitpod

https://gitpod.io/#github.com/hpssjellis/Gitpod-auto-tensorflowJS-to-arduino

This Github site is at Gitpod-auto-tensorflowJS-to-arduino


# better explained at https://github.com/hpssjellis/my-examples-for-the-arduino-portentaH7/tree/master/m09-Tensoflow/tfjs-convert-to-arduino-header



Remember to add this code to the top of your generated model.h file

```
#pragma once

const 

```

So the top of the header file looks like

```
#pragma once

const unsigned char model_tflite[] = {
```



Useful code for saving your models

```

Local or Download file name <input type="text" id="myFileName" value="model"> 

<input id="myFile5858" type="button" value="Save As..." onclick="{	
   ( async function (){									    
          const saveResults2 = await model4949.save('downloads://'+document.getElementById('myFileName').value);							    
          document.getElementById('myText02').value = JSON.stringify(saveResults2)									
	  //document.getElementById('myDiv4949').innerHTML += JSON.stringify(JSON.parse(saveResults2), null, 3)  
	  await model4949.summary(null,null,x => {document.getElementById('myDiv4949').innerHTML += x + '<br>'});
   })()  // inline async function								     
}"><br>	


<div id='myDiv4949'>...</div><br>

```



The main bash command file is, you could run these individually
```
  
#!/bin/bash

echo "Problem: When you change the file name of a TFJS model with it's shard files, you also must change the PATHS in the .json file"
echo "Easier to not change the models file names"
echo "Enter the name of your TensorflowJS .json saved model with the .json exctension, example: model.json"
read myFile
echo $myFile

tensorflowjs_converter --input_format=tfjs_layers_model --output_format=keras_saved_model ./$myFile ./
tflite_convert --keras_model_file ./ --output_file ./model.tflite
xxd -i model.tflite model.h


```
or if the file is called model.json then 


```
  
#!/bin/bash

tensorflowjs_converter --input_format=tfjs_layers_model --output_format=keras_saved_model ./model.json ./
tflite_convert --keras_model_file ./ --output_file ./model.tflite
xxd -i model.tflite model.h


```



Issues Aug10,2021   trying these as tfjs converter is not working
```
pyenv install 3.6.8
pyenv local 3.6.8
python3 -m pip install --upgrade pip 

```

Gitpod does not seem to work, but my ubuntu machine seemed fine just running  

```
pip3 install tansorflowjs
```

seemed to install everything

then the following did the conversion


```
tensorflowjs_converter --input_format=tf_saved_model  ./ ./forweb/
```
