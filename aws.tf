# Configure the AWS Provider
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "ami-13be557e"
  instance_type = "t2.micro"
  key_name	= "${var.key_name}"
}

output "instance_ips" {
  value = ["${aws_instance.example.*.private_ip}"]
}

output "public_ips" {
  value = ["${aws_instance.example.*.public_ip}"]
}

output "public_dns" {
  value = ["$[aws_instance.example.*.public_dns}"]
}
