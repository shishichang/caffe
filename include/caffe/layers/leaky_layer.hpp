#ifndef CAFFE_LEAKY_LAYER_HPP_
#define CAFFE_LEAKY_LAYER_HPP_

#include <vector>
#include "caffe/blob.hpp"
#include "caffe/layer.hpp"
#include "caffe/proto/caffe.pb.h"
#include "caffe/layers/neuron_layer.hpp"

namespace caffe {
template <typename Dtype>
class LeakyLayer : public NeuronLayer<Dtype>{
public:
    explicit LeakyLayer(const LayerParameter& param)
       : NeuronLayer<Dtype>(param) {}
    virtual void LayerSetUp(const vector<Blob<Dtype>*>& bottom,
          const vector<Blob<Dtype>*>& top);
    virtual inline const char* type() const { return "Leaky"; }
    virtual inline int ExactNumBottomBlobs() const { return 1; }
    virtual inline int ExactNumTopBlobs() const { return 1; }
protected:
      virtual void Forward_cpu(const vector<Blob<Dtype>*>& bottom,
          const vector<Blob<Dtype>*>& top);
      virtual void Forward_gpu(const vector<Blob<Dtype>*>& bottom,
          const vector<Blob<Dtype>*>& top);
      virtual void Backward_cpu(const vector<Blob<Dtype>*>& top,
          const vector<bool>& propagate_down, const vector<Blob<Dtype>*>& bottom){};//暂时还没实现
      virtual void Backward_gpu(const vector<Blob<Dtype>*>& top,
          const vector<bool>& propagate_down, const vector<Blob<Dtype>*>& bottom){};//暂时还没实现
};
} //caffe namespace
#endif //CAFFE_LEAKY_LAYER_HPP_
