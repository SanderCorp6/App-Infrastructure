variable "aws_access_key" {
  type = string
  default = ""
}
variable "aws_secret_key" {
  type = string
  default = ""
}
variable "aws_region" {
  type = string
  default = ""
}
variable "aws_bucket_name" {
  type = string
  default = ""
}

variable "api_service" {
  type = string
}
variable "api_email" {
  type = string
}
variable "api_password" {
  type = string
}
variable "api_image" {
  type = string
}
variable "api_jwt_secret" {
  type = string
}
variable "api_jwt_expiration" {
  type = string
}
variable "api_port" {
  type = string
}
variable "db_user" {
  type = string
}
variable "db_name" {
  type = string
}
variable "db_pass" {
  type = string
}
variable "db_port" {
  type = string
}
variable "frontend_url" {
  type = string
}
variable "api_url" {
  type = string
}
variable "app_image" {
  type = string
}

variable "aws_env" {
  type = string
}
variable "aws_key_pair_name" {
  type = string
}
variable "aws_sg_name" {
  type = string
}
variable "aws_server_name" {
  type = string
}

variable "main_domain" {
  type = string
}