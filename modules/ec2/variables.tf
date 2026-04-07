variable "ami" {}
variable "instance_type" {}
variable "instance_name" {}
variable "subnet_id" {
  description = "Subnet for EC2 instance"
  type        = string
}
variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
}

variable "security_group_id" {
  description = "Security group for EC2"
  type        = string
}