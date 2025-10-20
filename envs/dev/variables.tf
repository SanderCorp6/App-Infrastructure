variable "AWS_ACCESS_KEY" {
  type = string
  default = ""
}
variable "AWS_SECRET_KEY" {
  type = string
  default = ""
}
variable "AWS_REGION" {
  type = string
  default = ""
}

variable "API_SERVICE" {
  type = string
}
variable "API_EMAIL" {
  type = string
}
variable "API_PASSWORD" {
  type = string
}
variable "API_IMAGE" {
  type = string
}

variable "AWS_ENV" {
  type = string
}
variable "AWS_KEY_PAIR_NAME" {
  type = string
}
variable "AWS_SG_NAME" {
  type = string
}
variable "AWS_SERVER_NAME" {
  type = string
}

variable "MAIN_DOMAIN" {
  type = string
}