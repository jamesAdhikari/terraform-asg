terraform {
  backend "s3" {
    bucket = "maven-buckets"
    key    = "terraform/dev"
    region = "us-east-1"
  }
}
