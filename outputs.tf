output "eip_id" {
  description = "ID of the Elastic IP"
  value       = var.enabled ? var.eip_creation ? aws_eip.this[0].id : "" : ""
}

output "eip_public_ip" {
  description = "Public IP of the Elastic IP for the NAT instance"
  value       = var.enabled ? var.eip_creation ? aws_eip.this[0].public_ip : "" : ""
}

output "eni_id" {
  description = "ID of the ENI for the NAT instance"
  value       = aws_network_interface.this.id
}

output "eni_private_ip" {
  description = "Private IP of the ENI for the NAT instance"
  # workaround of https://github.com/terraform-providers/terraform-provider-aws/issues/7522
  value = tolist(aws_network_interface.this.private_ips)[0]
}

output "sg_id" {
  description = "ID of the security group of the NAT instance"
  value       = aws_security_group.this.id
}

output "iam_role_name" {
  description = "Name of the IAM role for the NAT instance"
  value       = aws_iam_role.this.name
}
