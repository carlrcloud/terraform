
#declare the output

output "server_public_ip_address" {
  value = aws_instance.linux_server01.public_ip
}
output "server_private_ip_address" {
  value = aws_instance.linux_server01.private_ip
}
output "server_id" {
  value = aws_instance.linux_server01.id
}