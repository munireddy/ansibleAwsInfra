provider "aws" {
   region = "us-east-2"
}

resource "aws_instance" "muniServers" {
  #ami = "ami-5e8bb23b"
  ami = "${lookup(var.amiid, var.region)}"
  instance_type = "t2.micro"
  count = "${var.instance_count}"
  vpc_security_group_ids = ["${var.security_group}"]
  tags {
    Name = "terraformInst--${count.index + 1}"
  }

  key_name = "${var.key_name}"

  user_data = "${file("user-data.txt")}"

#output "public_ip" {
#  value = "${aws_instance.example.public_ip}"
#}
#provisioner "local-exec" {
#    command = "apt install python -y && apt install python-apt -y"
#}

}
output "public_ip" {
#value = "${aws_instance.muniServers.public_ip}"
  value = "${formatlist("%v", aws_instance.muniServers.*.public_ip)}"
}
