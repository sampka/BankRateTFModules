provider "aws" {
    region     = "${var.region}"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "${var.s3_bucket_name}"
    acl = "private"

    tags {
        Name = "S3 Bucket For Ec2 Instance"
        Environment = "Dev"
    }
}
