module "s3" {
    source = "../s3"
    region = "${var.region}"
    s3_bucket_name = "${var.s3_bucket_name}"
}

module "sg" {
    source = "../sg"
    vpc_id = "${var.vpc_id}"
}

resource "aws_iam_instance_profile" "ec2_profile" {
    name = "ec2_s3_profile"
    role = "${aws_iam_role.role.name}"
}

resource "aws_iam_role" "role" {
    name = "ec2_s3_role"

    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "role_policy" {
    name = "ec2_s3_role_policy"
    role = "${aws_iam_role.role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": ["arn:aws:s3:::${var.s3_bucket_name}/*"]
    }
  ]
}
EOF
}

resource "aws_instance" "ec2_instance" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids = ["${module.sg.id}"]

    user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World"
                EOF
    
    subnet_id = "${var.subnet_id}"
    key_name = "${var.key_name}"

    tags {
        Name = "Created By Terraform"
    }
}
