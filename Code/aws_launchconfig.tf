resource "aws_launch_configuration" "alcf" {
  name          = "alcf"
  image_id      = "ami-08962a4068733a2b6"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.SG1.id ]
  user_data = data.template_file.user_data.rendered
lifecycle {
  create_before_destroy= true
}

}

resource "aws_launch_configuration" "alcf2" {
  name          = "alcf2"
  image_id      = "ami-01e7ca2ef94a0ae86"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.SG1.id ]
  user_data = data.template_file.user_data.rendered
lifecycle {
  create_before_destroy= true
}

}
data "template_file" "user_data"{
    template=file("user_data.sh")
}

resource "aws_autoscaling_group" "asg1" {
  name                      = "asg1"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = aws_launch_configuration.alcf.name
  vpc_zone_identifier       = [aws_subnet.private_subnet1.id]

}

resource "aws_autoscaling_group" "asg2" {
  name                      = "asg2"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = aws_launch_configuration.alcf2.name
  vpc_zone_identifier       = [aws_subnet.private_subnet2.id]


}