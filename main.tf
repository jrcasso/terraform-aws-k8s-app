terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "personal"
  region  = "us-east-1"
}

data "terraform_remote_state" "operation" {
  backend = "s3"
  config = {
    bucket = "terraform-operations"
    key    = "${var.operation}/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_route53_record" "domain" {
  zone_id       = data.terraform_remote_state.operation.outputs.hosted_zone.id
  name            = "${var.name}.${data.terraform_remote_state.operation.outputs.hosted_zone.name}"
  type            = "CNAME"
  ttl             = 60
  records         = [var.load_balancer]
}
