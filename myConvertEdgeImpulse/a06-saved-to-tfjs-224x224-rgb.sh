
#!/bin/bash

unzip ei-ei-0unknown-1heartrock-v0.1.1-transfer-learning-tensorflow-savedmodel-model.zip
tensorflowjs_converter --input_format=tf_saved_model  ./saved_model/ ./for_tfjs_224x224_rgb/
