data "aws_vpc" "defualt" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.defualt.id]
  }
}