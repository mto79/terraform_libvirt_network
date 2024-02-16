variable "name" {
  description = "A unique name for the resource, required by libvirt. Changing this forces a new resource to be created."
  type        = string
}

variable "domain" {
  description = "The domain used by the DNS server (Optional)"
  type        = string
}

variable "addresses" {
  description = "A list of (0 or 1) IPv4 and (0 or 1) IPv6 subnets in CIDR notation. (Optional) "
  type        = list(string)
}

variable "dhcp" {
  description = "DHCP configuration. You need to use it in conjuction with the adresses variable. (Optional)"
  type = list(object({
    enabled = optional(bool)
  })) 
}

variable "mode" {
  description = "The mode of network. (Optional)"
  type        = string
}

variable "autostart" {
  description = "Autostarting the network. (Optional)"
  type        = bool
}

variable "dns" {
  description = "DNS configuration. You need to use it in conjuction with the adresses variable. (Optional)"
  type = list(object({
    enabled = optional(bool)
    local_only = optional(bool)
    forwarders = optional(list(object({
      address = string
    })))
    srvs = optional(list(object({
      service = string
      protocol = string
    })))
    hosts = optional(list(object({
      hostname = string
      ip = string
    })))
  })) 
}
