Put your TensorflowJS saved models into this folder and run the command (Note: the tab key auto fills after a few letters)

```
./a01-convert-tfjs-arduino.sh

```


You can look at that file to determine the individual commands if you have different file names or want to do something different

```
tensorflowjs_converter --input_format=tfjs_layers_model --output_format=keras_saved_model ./model.json ./

tflite_convert --keras_model_file ./ --output_file ./model.tflite

xxd -i model.tflite model.h

```

