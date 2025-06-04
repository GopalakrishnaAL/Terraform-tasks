provider "aws" {
  region = "us-west-2"
  alias  = "Oregon"

  default_tags {
    tags = {
      Environment = "Gopal"
      Project     = "oregon-testing"
    }
  }
}