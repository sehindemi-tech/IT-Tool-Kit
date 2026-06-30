resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.alb_listener.http.port
  protocol          = var.alb_listener.http.protocol

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}



resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.alb_listener.https.port
  protocol          = var.alb_listener.https.protocol
  ssl_policy        = var.alb_listener.https.ssl_policy
  certificate_arn   = var.alb_listener.https.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

