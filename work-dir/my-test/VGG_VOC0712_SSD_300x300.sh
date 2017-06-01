#cd /home/ubuntu/xushungou/caffe-ssd
../build/tools/caffe test \
--model="test.prototxt" \
--weights="VGG_VOC0712_SSD_300x300_iter_60000.caffemodel" \
--iterations="536870911" \
--gpu 0
