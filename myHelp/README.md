


My javascript single page TensorflowJS files at https://github.com/hpssjellis/beginner-tensorflowjs-examples-in-javascript

My PortentaH& Machine Learning Files at 

https://github.com/hpssjellis/my-examples-for-the-arduino-portentaH7/tree/master/m09-Tensoflow


This gitpod converter at 

https://github.com/hpssjellis/Gitpod-auto-tensorflowJS-to-arduino


Still working on this but this bit of code does some interesting stuff from the TF hub


```
tensorflowjs_converter --input_format=tf_hub --quantization_bytes=1 'https://tfhub.dev/google/imagenet/mobilenet_v1_100_224/classification/1' web_model

```

also interesting for TF-hub.

```
change
https://tfhub.dev/google/universal-sentence-encoder/1

To:

https://storage.googleapis.com/tfhub-modules/google/universal-sentence-encoder/1.tar.gz

curl -LO https://storage.googleapis.com/tfhub-modules/google/universal-sentence-encoder/1.tar.gz
tar xvzf imagenet_mobileTF.tar.gz



curl -LO https://storage.googleapis.com/tfhub-modules/google/aiy/vision/classifier/birds_V1/1.tar.gz
tar xvzf 1.tar.gz




```



This does generate a tfjs file from the tf-hub with this warning

"Warning: --quantization_bytes will be deprecated in a future release Please consider using --quantize_uint8, --quantize_uint16, --quantize_float16."


unfortuantely the output is quantizied and I am having troubles converting that to TFLite

```
tensorflowjs_converter --input_format=tf_hub  'https://tfhub.dev/google/imagenet/mobilenet_v1_100_224/classification/3' ./

```
