variable "dns" {
  description = "The dns hosted zone configuration"

  type = object({
    zone_name = string
  })
}

variable "dns_alias" {
  description = "The dns alias record"
  type = object({
    type = string
    alias = object({
      alb_dns_name = string
      alb_zone_id  = string
    })
  })
}