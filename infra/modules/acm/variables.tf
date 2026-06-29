variable "acm_settings" {
  description = "The ACM settings for the hosted zone"
  type = object({
    domain_name = string
    zone_id     = string
  })
}