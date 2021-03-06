# AWS Notes

These are my personal notes on using Amazon Web Services.

## Launch a Virtual Machine

[Amazon Web Services](https://aws.amazon.com/getting-started/tutorials/launch-a-virtual-machine/)

* [AWS Console](https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#)
* Click on "Launch Instance"
* RHEL 7.3, click on "Select"
* Click on "Review and Launch"
* Click on "Launch"
* Select a key pair (or generate new one), check "I acknowledge...", and click "Launch Instances"
* Get IP address from [Console] (https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2)


```
ssh -i wfdoran.pem ec2-user@xxx.xxx.xxx.xxx

sudo yum install gcc
sudo yum install wget
wget https://golang.org/dl/go1.7.5.linux-amd64.tar.gz
gunzip go1.7.5.linux-amd64.tar.gz
tar -xf go1.7.5.linux-amd64.tar
PATH=$PATH:$HOME/go/bin
export GOROOT=$HOME/go

```

## Basic Settings for p2.xlarge instance

```
ssh -i wfdoran.pem ec2-user@xxx.xxx.xxx.xxx

sudo yum install gcc
sudo yum install gcc-c++
sudo yum install perl
sudo yum install wget
sudo yum install kernel-devel-$(uname -r) kernel-headers-$(uname -r)

wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
chmod +x cuda_8.0.61_375.26_linux-run

sudo ./cuda_8.0.61_375.26_linux-run
  EULA: accept
  Driver: yes
  OpenGL: yes
  nvidia-xconfig: no
  CUDA 8.0 Toolkit: yes
  Location: default
  sym link: yes
  samples: yes
  Location: default
  
export PATH=/usr/local/cuda-8.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH

wget https://raw.githubusercontent.com/wfdoran/aws-notes/master/examples/hello_cuda.cu
nvcc hello_cuda.cu -o hello_cuda
./hello_cuda

cd NVIDIA_CUDA-8.0_Samples
make
cd 0_Simple/vectorAdd
./vectorAdd
```



## Billing

[Billing Page](https://console.aws.amazon.com/billing/home?#/)

