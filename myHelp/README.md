


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



Things I am working on

```

usage: tflite_convert.py [-h] --output_file OUTPUT_FILE
                          (--graph_def_file GRAPH_DEF_FILE | --saved_model_dir SAVED_MODEL_DIR)
                          [--output_format {TFLITE,GRAPHVIZ_DOT}]
                          [--inference_type {FLOAT,QUANTIZED_UINT8}]
                          [--inference_input_type {FLOAT,QUANTIZED_UINT8}]
                          [--input_arrays INPUT_ARRAYS]
                          [--input_shapes INPUT_SHAPES]
                          [--output_arrays OUTPUT_ARRAYS]
                          [--saved_model_tag_set SAVED_MODEL_TAG_SET]
                          [--saved_model_signature_key SAVED_MODEL_SIGNATURE_KEY]
                          [--std_dev_values STD_DEV_VALUES]
                          [--mean_values MEAN_VALUES]
                          [--default_ranges_min DEFAULT_RANGES_MIN]
                          [--default_ranges_max DEFAULT_RANGES_MAX]
                          [--drop_control_dependency DROP_CONTROL_DEPENDENCY]
                          [--reorder_across_fake_quant REORDER_ACROSS_FAKE_QUANT]
                          [--change_concat_input_ranges CHANGE_CONCAT_INPUT_RANGES]
                          [--allow_custom_ops ALLOW_CUSTOM_OPS]
 tflite_convert.py: error:



tflite_convert --output_file=model_quant.tflite \
 --keras_model_file=model.h5 \
 --inference_type=QUANTIZED_UINT8 \
 --input_arrays=input_1 \
 --output_arrays=predictions/Softmax \
 --mean_values=128 \
 --std_dev_values=127 \
 --input_shape="1,224,224,3"


tflite_convert \
  --output_file=keras_mnist_quantized_uint8.tflite \
  --keras_model_file=mnist_cnn.h5 \
  --inference_type=QUANTIZED_UINT8 \
  --mean_values=128 \
  --std_dev_values=127 \
  --default_ranges_min=0 \
  --default_ranges_max=255 \
  --input_arrays=conv2d_1_input \
  --output_arrays=dense_2/Softmax


tflite_convert \
--graph_def_file=optimized_graph.pb \
--output_format=TFLITE \
--output_file=mobilenet_v2_new.tflite \
--inference_type=QUANTIZED_UINT8 \
--input_arrays=input \
--output_arrays=final_result \
--input_shapes=1,224,224,3 \
--mean_values=128 --std_dev_values=127 \
--default_ranges_min=0 --default_ranges_max=255








@ZJPUBG In the last step I mentioned, invoke toco to convert .pb into int8 tflite FlatBuffer, make sure to set
--inference_type=QUANTIZED_UINT8 and --inference_input_type=QUANTIZED_UINT8




and this one works but does not qunatizie the output




tflite_convert --output_file=model_quant.tflite \
 --keras_model_file=model.h5 \
 --inference_type=QUANTIZED_UINT8 \
 --mean_values=128 \
 --std_dev_values=127 

 xxd -i model_quant.tflite model_quant.h
 
 


```


read cool stuff by vincent muyller

https://itnext.io/shrink-your-tensorflow-js-web-model-size-with-weight-quantization-6ddb4fcb6d0d

and

https://itnext.io/18-tips-for-training-your-own-tensorflow-js-models-in-the-browser-3e40141c9091



or

https://heartbeat.fritz.ai/8-bit-quantization-and-tensorflow-lite-speeding-up-mobile-inference-with-low-precision-a882dfcafbbd


