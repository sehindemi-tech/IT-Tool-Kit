output "certificate_arn" {
  description = "The certifcate arn for ALB"
  value       = aws_acm_certificate.this.arn
}