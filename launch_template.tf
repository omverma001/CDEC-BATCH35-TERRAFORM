provider "aws" {
  region = "us-east-1"
}

resource "aws_launch_template" "lt_home" {
  name_prefix   = "my-launch-template-"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_pair

  vpc_security_group_ids = var.vpc_security_group_ids

  user_data = base64encode(<<EOF
#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
systemctl enable apache2

echo "<h1>Welcome to Home Page</h1>" > /var/www/html/index.html

EOF
  )
    tags = {
      env  = var.env
    }
  }


resource "aws_launch_template" "lt_cloth" {
  name_prefix   = "my-launch-template-"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_pair

  vpc_security_group_ids = var.vpc_security_group_ids

  user_data = base64encode(<<EOF
#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
systemctl enable apache2
mkdir /var/www/html/cloth/
echo "<h1>this is cloth section</h1>" > /var/www/html/index.html

EOF
  )

    tags = {
      env  = var.env
    }
  }
resource "aws_launch_template" "lt_laptop" {
  name_prefix   = "my-launch-template-"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_pair

  vpc_security_group_ids = var.vpc_security_group_ids

  user_data = base64encode(<<EOF
#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
systemctl enable apache2
mkdir /var/www/html/laptop
echo "<h1>this is laptop section</h1>" > /var/www/html/laptop/index.html

EOF
  )

    tags = {
      env  = var.env
    }
  }
