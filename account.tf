provider "aws" {
  region = "us-east-1"
}

locals {

  vpc = "vpc-d5a133af"

  subnets = [
    {
      id = "subnet-a6bcaaec"
      cidr = "172.31.16.0/20"
      az = "us-east-1a"
    }
   
  ]
}
