
resource "aws_autoscaling_group" "kg" {
  name                      = "kg-terraform-test"
  max_size                  = "2"
  min_size                  = "1"
  desired_capacity          = "1"
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.kg_conf.name}"
  vpc_zone_identifier       =  "${var.subnets}"
}

resource "aws_launch_configuration" "kg_conf" {
  name_prefix   = "kg-asg-conf"
  image_id      = "ami-0c322300a1dd5dc79"
  instance_type = "t2.micro"
  security_groups = [ "sg-0d45d512d75789b6f" ]
  key_name = "mykey-prakash"
  user_data       = "${file("user-data.sh")}"
  iam_instance_profile = "${aws_iam_instance_profile.prakash_profile.arn}"
  lifecycle {
    create_before_destroy = true
  }
}


