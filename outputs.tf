output "id" {
  description = "The unique ID of the libvirt network"
  value       = libvirt_network.default.id
}

output "name" {
  description = "The name of the libvirt network"
  value       = libvirt_network.default.name
}
