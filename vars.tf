variable "create" {
    default = true
} 

variable "region" {
    default = "us-east-1"
}

variable "vpc_id" {
    default = "vpc-c3fb88a5"
}

variable "subnet_id" {
    type = "string"
    default = "subnet-194c1242"
}

variable "volume_size" {
    default = "30"
    type = "string"
}

variable "instance_type" {
    type = "string"
    default = "c4.large"
}

variable "ami" {
    default = "ami-97785bed"
}

variable "key_name" {
    default = "ec2_key_name"
}

# Security Groups Rules
variable "ingress_rules" {
    default = []
}

variable "s3_bucket_name" {
    default = "terraform_test_today"
}