output "ec2_instance_name"{

  value = aws_instance.app_server.tags.Name
  description = "Name of the EC2 instance created in AWS."
}

output "ec2_instance_id"{

  value = aws_instance.app_server.id
  description = "Id of the EC2 instance created in AWS."

}

output "ec2_instance_state"{

  value = aws_instance.app_server.instance_state
  description = "State of the EC2 instance created in AWS."

}

output "ec2_instance_type"{

  value = aws_instance.app_server.instance_type
  description = "Type of the EC2 instance created in AWS."

}

output "ec2_instance_publicIP"{

  value = aws_instance.app_server.public_ip
  description = "Public IP (IPv4) address of the EC2 instance created in AWS."

}
