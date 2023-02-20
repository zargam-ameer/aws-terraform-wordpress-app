variable "database_name" {
  default = "wordpress_db"
  type = string
}
variable "database_password" {
  default = "PassWord4-user"
  type = string
}
variable "database_user" {
  default = "wordpress_user"
  type = string
}

variable "region" {
  default = "ap-southeast-2"
  type = string
}
#variable "shared_credentials_file" {}
variable "IsUbuntu" {
  type    = bool
  default = true

}
variable "AZ1" {
  default = "ap-southeast-2a"
  type = string
}
variable "AZ2" {
  default = "ap-southeast-2b"
  type = string
}
variable "AZ3" {
  default = "ap-southeast-2c"
  type = string
}
variable "VPC_cidr" {
  default = "10.130.0.0/18"
}
variable "subnet1_cidr" {
  default = "10.130.0.0/24"
}
variable "subnet2_cidr" {
  default = "10.130.1.0/24"
}
variable "subnet3_cidr" {
  default = "10.130.2.0/24"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "EC2 instance type"
}
variable "instance_class" {
  type = string
  default = "db.t2.micro"
  description = "EC2 instance type"
}
variable "PUBLIC_KEY_PATH" {
  default = "./mykey-pair.pub"
}
variable "PRIV_KEY_PATH" {
  default = "./mykey-pair"
}
variable "root_volume_size" {
  default = 22
}
