resource "aws_instance" "web" {
  ami                    = var.amiIDs[var.REGION]
  instance_type          = "t3.micro"
  key_name               = "test-key"
  vpc_security_group_ids = [aws_security_group.terra-sg.id]
  availability_zone      = var.ZONE1

  tags = {
    Name    = "Terra-Instance"
    Project = "Terra"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  connection {
    type        = "ssh"
    user        = var.webUSER
    private_key = file("test-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

}

resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running"
}

output "webPublicIP" {
  description = "Public IP of Ubuntu instance"
  value       = aws_instance.web.public_ip
}

output "webPrivateIP" {
  description = "Private IP of Ubuntu instance"
  value       = aws_instance.web.private_ip
}