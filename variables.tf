variable "ec2_instance_type" {
  default = "t2.micro"
  type    = string
}

variable "ec2_root_storage_size" {
  default = 15
  type    = number
}

variable "ec2-ami_id" {
  default = "ami-06b6e5225d1db5f46"
  type    = string
}