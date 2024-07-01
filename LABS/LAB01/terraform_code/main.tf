provider "aws" {
    region = "us-west-2"
}
resource "aws_instance" "vmlab01" {
    ami           = "ami-01572eda7c4411960"
    subnet_id     = "subnet-051b2318de734fafb"
    instance_type = "t2.micro"
    tags = {
        Name = "vmlaboratorio01"
    } 
}