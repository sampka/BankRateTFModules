resource "aws_security_group" "ssh" {
    name = "ssh"
    description = "Allow SSH access"
    vpc_id = "${var.vpc_id}"

    ingress {
        from_port = 0
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}