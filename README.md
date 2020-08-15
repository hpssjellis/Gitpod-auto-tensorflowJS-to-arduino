# Gitpod-auto-tensorflowJS-to-arduino

better information in the README.mdf file in the myFolder directory


Load this live with Gitpod

https://gitpod.io/#github.com/hpssjellis/Gitpod-auto-tensorflowJS-to-arduino

This Github site is at Gitpod-auto-tensorflowJS-to-arduino


Remmeber to add this code to the top of your generated model.h file

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





