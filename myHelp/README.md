


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



note tensorflowjs_convert seems fairly up to date with options:

```
tensorflowjs_convert -h 
```


```

usage: TensorFlow.js model converters. [-h] [--input_format {keras_saved_model,tf_frozen_model,tfjs_layers_model,keras,tf_saved_model,tf_hub}]
                                       [--output_format {keras,keras_saved_model,tfjs_graph_model,tfjs_layers_model}]
                                       [--signature_name SIGNATURE_NAME] [--saved_model_tags SAVED_MODEL_TAGS]
                                       [--quantize_float16 [QUANTIZE_FLOAT16]] [--quantize_uint8 [QUANTIZE_UINT8]]
                                       [--quantize_uint16 [QUANTIZE_UINT16]] [--quantization_bytes {1,2}] [--split_weights_by_layer] [--version]
                                       [--skip_op_check] [--strip_debug_ops STRIP_DEBUG_OPS] [--weight_shard_size_bytes WEIGHT_SHARD_SIZE_BYTES]
                                       [--output_node_names OUTPUT_NODE_NAMES] [--control_flow_v2 CONTROL_FLOW_V2] [--experiments EXPERIMENTS]
                                       [input_path] [output_path]

positional arguments:
  input_path            Path to the input file or directory. For input format "keras", an HDF5 (.h5) file is expected. For input format
                        "tensorflow", a SavedModel directory, frozen model file, or TF-Hub module is expected.
  output_path           Path for all output artifacts.

optional arguments:
  -h, --help            show this help message and exit
  --input_format {keras_saved_model,tf_frozen_model,tfjs_layers_model,keras,tf_saved_model,tf_hub}
                        Input format. For "keras", the input path can be one of the two following formats: - A topology+weights combined HDF5
                        (e.g., generated with `tf.keras.model.save_model()` method). - A weights-only HDF5 (e.g., generated with Keras Model's
                        `save_weights()` method). For "keras_saved_model", the input_path must point to a subfolder under the saved model folder
                        that is passed as the argument to tf.contrib.save_model.save_keras_model(). The subfolder is generated automatically by
                        tensorflow when saving keras model in the SavedModel format. It is usually named as a Unix epoch time (e.g., 1542212752).
                        For "tf" formats, a SavedModel, frozen model, or TF-Hub module is expected.
  --output_format {keras,keras_saved_model,tfjs_graph_model,tfjs_layers_model}
                        Output format. Default: tfjs_graph_model.
                        
```

```
  --signature_name SIGNATURE_NAME
                        Signature of the SavedModel Graph or TF-Hub module to load. Applicable only if input format is "tf_hub" or
                        "tf_saved_model".
  --saved_model_tags SAVED_MODEL_TAGS
                        Tags of the MetaGraphDef to load, in comma separated string format. Defaults to "serve". Applicable only if input format is
                        "tf_saved_model".
  --quantize_float16 [QUANTIZE_FLOAT16]
                        Comma separated list of node names to apply float16 quantization. You can also use wildcard symbol (*) to apply
                        quantization to multiple nodes (e.g., conv/*/weights). When the flag is provided without any nodes the default behavior
                        will match all nodes.
  --quantize_uint8 [QUANTIZE_UINT8]
                        Comma separated list of node names to apply 1-byte affine quantization. You can also use wildcard symbol (*) to apply
                        quantization to multiple nodes (e.g., conv/*/weights). When the flag is provided without any nodes the default behavior
                        will match all nodes.
  --quantize_uint16 [QUANTIZE_UINT16]
                        Comma separated list of node names to apply 2-byte affine quantization. You can also use wildcard symbol (*) to apply
                        quantization to multiple nodes (e.g., conv/*/weights). When the flag is provided without any nodes the default behavior
                        will match all nodes.
  --quantization_bytes {1,2}
                        (Deprecated) How many bytes to optionally quantize/compress the weights to. 1- and 2-byte quantizaton is supported. The
                        default (unquantized) size is 4 bytes.
```

```
  --split_weights_by_layer
                        Applicable to keras input_format only: Whether the weights from different layers are to be stored in separate weight
                        groups, corresponding to separate binary weight files. Default: False.
  --version, -v         Show versions of tensorflowjs and its dependencies
  --skip_op_check       Skip op validation for TensorFlow model conversion.
  --strip_debug_ops STRIP_DEBUG_OPS
                        Strip debug ops (Print, Assert, CheckNumerics) from graph.
  --weight_shard_size_bytes WEIGHT_SHARD_SIZE_BYTES
                        Shard size (in bytes) of the weight files. Currently applicable only when output_format is tfjs_layers_model or
                        tfjs_graph_model.
  --output_node_names OUTPUT_NODE_NAMES
                        The names of the output nodes, separated by commas. E.g., "logits,activations". Applicable only if input format is
                        "tf_frozen_model".
  --control_flow_v2 CONTROL_FLOW_V2
                        Enable control flow v2 ops, this would improve inference performance on models with branches or loops.
  --experiments EXPERIMENTS
                        Enable experimental features, you should only enable this flag when using Python3 and TensorFlow nightly build.

```



These could be very helpful



tflite_convert main python program
https://github.com/tensorflow/tensorflow/blob/master/tensorflow/lite/python/tflite_convert.py


Tensorflowjs_convert main area also callled tfjs_converter
https://github.com/tensorflow/tfjs/tree/master/tfjs-converter



This page by Mueller is really interesting but probably deprecated
https://itnext.io/shrink-your-tensorflow-js-web-model-size-with-weight-quantization-6ddb4fcb6d0d

