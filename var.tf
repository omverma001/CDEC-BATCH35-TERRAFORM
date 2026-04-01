variable "image_id" {
  default     = "ami-0ec10929233384c7f"
}

variable "instance_type" {
  default     = "t2.micro"
}

variable "key_pair" {
  default     = "nv-new"
}

variable "vpc_security_group_ids" {
  default     = ["sg-08299e0e4d611acf9"]
}

variable "env" {
  default     = "dev"
}
variable "min_size" {
  default = 2
}

variable "max_size" {
  default = 4
}

variable "desired_size" {
  default = 2
}

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "env" {
  default = "dev"
}

variable "vpc_id" {
  default     = "vpc-01166ad1f1b8c820e"
}
variable "subnets_id" {
  default = [
    "subnet-02b91d97e940b7c9c",
    "subnet-08b0041f5dcbfa2f4",
    "subnet-0166845280ef9eb98"
  ]
}