# Outputs file
output "catapp_url" {
  value = "http://${aws_instance.hashicat.public_dns}"
}
output "catapp_ip" {
  value = "http://${aws_instance.hashicat.public_ip}"
}
output "catapp_privip" {
  value = "http://${aws_instance.hashicat.private_ip}"
}
