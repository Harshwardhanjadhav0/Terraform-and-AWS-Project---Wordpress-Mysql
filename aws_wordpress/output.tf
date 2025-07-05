# ADDED: Output for WordPress EC2 public IP
output "wordpress_public_ip" {
  value = aws_instance.wordpress_ec2.public_ip
  description = "Public IP address of WordPress EC2 instance"
}

output "wordpress_public_dns" {
  value = aws_instance.wordpress_ec2.public_dns
  description = "Public DNS name of WordPress EC2 instance"
}