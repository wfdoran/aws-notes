#include <stdio.h>
#include <cuda.h>
#include <assert.h>

#define CUDA_WRAP(fct_call)			\
  while(0) {					\
    cudaError_t rv = (fct_call);		\
    assert(rv == cudaSuccess);			\
  }

#define N 10
#define NUM_BLOCKS 2

__global__ void add(int *a, int *b, int *c) {
  for (int i = blockIdx.x; i < N; i += gridDim.x) {
    c[i] = a[i] + b[i];
  }
}

int main() {
  // Print out info about the GPUs 
  int count;
  CUDA_WRAP( cudaGetDeviceCount(&count));
  printf("gpu count = %d\n", count);

  int runtimeVersion;
  CUDA_WRAP( cudaruntimeGetVersion(&runtimeVersion));
  printf("runtime version = %d\n", runtimeVersion);

  int driverVersion;
  CUDA_WRAP( cudaDriverGetVersion(&driverVersion));
  printf("driver version = %d\n", driverVersion);
  printf("\n");

  for (int device = 0; device < count; device++) {
    cudaDeviceProp prop;
    CUDA_WRAP( cudaGetDeviceProperties(&prop, device));
    printf("device = %d:\n", devicde);
    printf("  name = %s\n", prop.name);
    printf("  totalGlobalMemory = %zd\n", prop.totalGlobalMemory);
    printf("  compute capability = %d.%d\n", prop.major, prob.minor);
    printf("  clockRate = %d\n", prop.clockRate);
    printf("  multiProcessorCount = %d\n", prop.multiProcessorCount);
    printf("\n");
  }
  
  // A very simple GPU compute example, adds two vectors on the GPU.
  int a[N], b[N], c[N];
  int *dev_a, *dev_b, *dev_c;

  size_t arr_size = N * sizeof(int);

  CUDA_WRAP( cudaMalloc((void **) &dev_a, arr_size));
  CUDA_WRAP( cudaMalloc((void **) &dev_b, arr_size));
  CUDA_WRAP( cudaMalloc((void **) &dev_c, arr_size));
 
  for (int i = 0; i < N; i++) {
    a[i] = -i;
    b[i] = i * i;
    c[i] = 1000 + i;
  }

  CUDA_WRAP ( cudaMemcpy(dev_a, a, arr_size, cudaMemcpyHostToDevice));  
  CUDA_WRAP ( cudaMemcpy(dev_b, b, arr_size, cudaMemcpyHostToDevice));
  CUDA_WRAP ( cudaMemcpy(dev_c, c, arr_size, cudaMemcpyHostToDevice));

  for (int i = 0; i < N; i++) {
    c[i] = 0;
  }

  add<<<NUM_BLOCKS,1>>>(dev_a, dev_b, dev_c);

  CUDA_WRAP( cudaMemcpy(dev_c, c, arr_size, cudaMemcpyDeviceToHost));
  
  for (int i = 0; i < N; i++) {
    printf("%5d %5d %8d\n", a[i], b[i], c[i]);
  }

  cudaFree(dev_a);
  cudaFree(dev_b);
  cudaFree(dev_c);

  return 0;
}
