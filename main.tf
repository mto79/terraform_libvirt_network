resource "libvirt_network" "default" {
  name = var.name
  domain = var.domain
  mode = var.mode
  addresses = var.addresses
  
  dynamic "dhcp" {
    for_each = var.dhcp

    content {
      enabled  = dhcp.value.enabled
    }
  }
  
  autostart = var.autostart
 
  dynamic "dns" {
    for_each = var.dns

    content {
      enabled  = dns.value.enabled
      local_only = dns.value.local_only
      
      dynamic "forwarders" {
        for_each = dns.value.forwarders != null ? dns.value.forwarders : []

        content {
          address = forwarders.value.address
        }      
      }

      dynamic "hosts" {
        for_each = dns.value.hosts != null ? dns.value.hosts : []

        content {
          hostname = hosts.value.hostname
          ip = hosts.value.ip   
        }      
      }      
    }
  }
   
 
}