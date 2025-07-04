# output "ec2_public-ip" {
#  value = aws_instance.tf_test_instance[*].public_ip
# }

# output "ec2_public_dns" {
#  value = aws_instance.tf_test_instance[*].public_dns
# }

# output "ec2_private_ip" {
#  value = aws_instance.tf_test_instance[*].private_ip
#}

output "ec2_public_ip" {
  value = [
    for instance in aws_instance.tf_test_instance : instance.public_ip
  ]
}

output "ec2_public_dns" {
  value = [
    for instance in aws_instance.tf_test_instance : instance.public_dns
  ]
}

output "ec2_private_ip" {
  value = [
    for instance in aws_instance.tf_test_instance : instance.private_ip
  ]
  
}