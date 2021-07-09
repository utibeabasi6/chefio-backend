output "Instance1_eip"{
    value = aws_eip.instance1_eip.public_ip
}

output "Instance2_eip"{
    value = aws_eip.instance2_eip.public_ip
}