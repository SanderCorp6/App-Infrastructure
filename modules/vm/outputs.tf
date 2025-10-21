# Instance IP Output
output "aws_instance_ip" {
    value = aws_instance.rrhh_app_instance.public_ip
}