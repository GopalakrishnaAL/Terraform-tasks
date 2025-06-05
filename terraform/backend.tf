terraform {
  backend "s3" {
    bucket       = "state-file-ireland"
    key          = "ireland_terraform_file/repo_1_oregon.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    # use_lockfile = true
  }
}