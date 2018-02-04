module "ec2" {
    source = "modules/ec2"
    subnet_id = "${var.subnet_id}"
    key_name = "${var.key_name}"
    instance_type = "${var.instance_type}"
    ami = "${var.ami}"
    region = "${var.region}"
    s3_bucket_name = "${var.s3_bucket_name}"
    vpc_id = "${var.vpc_id}"
}