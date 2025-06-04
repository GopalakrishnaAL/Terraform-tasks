terraform {
  backend "s3" {
    bucket       = "state-file-Oregon"
    key          = "Oregon_terraform_file/Repo_1_Oregon.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    # use_lockfile = true
  }
}