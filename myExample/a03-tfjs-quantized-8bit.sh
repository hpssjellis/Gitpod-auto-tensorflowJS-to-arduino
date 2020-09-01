#!/bin/bash

tensorflowjs_converter --input_format=tfjs_layers_model  --quantization_bytes 1 --output_format=keras_saved_model ./model.json ./
tflite_convert --keras_model_file ./ --output_file ./model.tflite
xxd -i model.tflite model.h
