#include <algorithm>
#include <vector>

#include "caffe/layers/neuron_layer.hpp"
#include "caffe/layers/leaky_layer.hpp"


namespace caffe {

//add by yang
template <typename Dtype>
__global__ void LeakyForward(const int n, const Dtype* in, Dtype* out){
    CUDA_KERNEL_LOOP(index, n){
        out[index] = in[index] > 0 ? in[index] : in[index]*0.1;
    }
}

template <typename Dtype>
void LeakyLayer<Dtype>::Forward_gpu(
    const vector<Blob<Dtype>*>& bottom, const vector<Blob<Dtype>*>& top) {
  const int count = bottom[0]->count();
  const Dtype* bottom_data = bottom[0]->gpu_data();
  Dtype* top_data = top[0]->mutable_gpu_data();
  LeakyForward<Dtype><<<CAFFE_GET_BLOCKS(count), CAFFE_CUDA_NUM_THREADS>>>(
          count, bottom_data, top_data);
  CUDA_POST_KERNEL_CHECK;
}
INSTANTIATE_LAYER_GPU_FUNCS(LeakyLayer);

}//namespace caffe