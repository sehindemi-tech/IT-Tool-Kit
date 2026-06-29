variable "dns" {
  description = "The dns hosted zone configuration"
  type = object({
    zone_name = string
  })
}