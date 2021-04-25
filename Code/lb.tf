resource "aws_elb" "lb2" {
  name               = "lb2"
 # availability_zones =  ["us-east-2a", "us-east-2b", "us-east-2c"]
  subnets = [aws_subnet.private_subnet1.id]
  internal = "true"

  

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances                   = [aws_instance.VM1.id,aws_instance.VM2.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "terraform-elb"
  }
}