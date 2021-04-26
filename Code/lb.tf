resource "aws_elb" "lb2" {
  name               = "lb2"
  #availability_zones =  ["us-east-2a"]
  subnets = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
  security_groups = [aws_security_group.sg_lb.id ]
  # internal = "true"

  

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  /*instances                   = [aws_instance.VM1.id,aws_instance.VM2.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
*/
  tags = {
    Name = "terraform-elb"
  }
}