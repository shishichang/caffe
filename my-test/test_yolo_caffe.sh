#########################################################################
# File Name: ./yolo/yolo2caffe/test_yolo_caffe.sh
# Author: ssc
# Mail: sysu_c@163.com
# Created Time: Tue Jun  6 10:06:48 2017
#########################################################################
#!/bin/bash
#argv[1]网络的prototxt
#argv[2]权重文件(如果编译时候使用的是loadweight，argv[2]对应的是txt文件夹，如果使用的是CopyTrainedLayersFromBinaryProto，argv[2]对应的是caffemodel)
#argv[3]图片文件
~/ssc/caffe-ssd/build/tools/run_yolo models/yolo-deploy.prototxt models/yolo.caffemodel data/1.jpg
