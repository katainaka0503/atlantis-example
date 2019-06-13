terraform {
  required_version = "~> 0.12.0"

  backend "s3" {
    bucket = "terraform-state-bucket"
    key    = "path/to/my/key"
    region = "region"
  }
}

provider "aws" {
  version = "~> 2.0"
  region  = "ap-northeast-1"
}

module "atlantis" {
  source  = "terraform-aws-modules/atlantis/aws"
  version = "~> 2.0"

  name = "atlantis"

  cidr            = "10.20.0.0/16"
  azs             = ["ap-northeast-1a", "ap-northeast-1c"]
  private_subnets = ["10.20.1.0/24", "10.20.2.0/24"]
  public_subnets  = ["10.20.101.0/24", "10.20.102.0/24"]

  route53_zone_name = var.route53_zone_name

  policies_arn = [
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]

  atlantis_github_user       = var.atlantis_github_user
  atlantis_github_user_token = var.atlantis_github_user_token
  atlantis_repo_whitelist    = var.atlantis_repo_whitelist
}
