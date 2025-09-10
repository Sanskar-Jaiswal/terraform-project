output "ec2_public_ip" {
    description = "Public IP of the EC2 instance"
    value       = aws_instance.projectec2.public_ip
}

output "ssh_command" {
  description = "SSH command to connect to EC2"
  value       = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.projectec2.public_ip}"
}