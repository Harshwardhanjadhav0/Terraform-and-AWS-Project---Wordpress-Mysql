resource "aws_instance" "wordpress_ec2" {
  ami = var.AMI_ID
  instance_type = var.INSTANCE_TYPE
  key_name = var.KEYPAIR_NAME
  vpc_security_group_ids = [ aws_security_group.wordpress_security_group.id ]
  subnet_id = var.public_subnet_1a_id
  tags = {
    Name = "Wordpress ec2 tf"
  }
  depends_on = [ aws_security_group.wordpress_security_group, var.public_subnet_1a_id, var.aws_db_instance_id]
}

# FIXED: WordPress installation with corrected commands and host reference
resource "null_resource" "remote_null" {

  depends_on = [ aws_instance.wordpress_ec2 ]

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("C:/Users/Lenovo/Downloads/terraform-key.pem")
    host = aws_instance.wordpress_ec2.public_ip  # FIXED: Use public_ip instead of id
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo yum update -y",
        "sudo yum install httpd -y",
        "sudo yum install git -y",
        "sudo amazon-linux-extras install mariadb10.5 php8.2 -y",  
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd",
        "sudo git clone https://github.com/WordPress/WordPress.git /tmp/WordPress",
        "sudo cp -r /tmp/WordPress/* /var/www/html/",  # FIXED: Case sensitive 'Wordpress' -> 'WordPress'
        "sudo chown -R apache:apache /var/www/html/",  # FIXED: Added group ownership
        "sudo chmod -R 755 /var/www/html/",  # ADDED: Proper permissions
        "sudo systemctl restart httpd"
     ]  
  }

}