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
variable "API_JWT_SECRET" {
  type = string
}
variable "API_JWT_EXPIRATION" {
  type = string
}
variable "API_PORT" {
  type = string
}
variable "DB_USER" {
  type = string
}
variable "DB_HOST" {
  type = string
}
variable "DB_NAME" {
  type = string
}
variable "DB_PASS" {
  type = string
}
variable "DB_PORT" {
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