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

## Billing

[Billing Page](https://console.aws.amazon.com/billing/home?#/)

