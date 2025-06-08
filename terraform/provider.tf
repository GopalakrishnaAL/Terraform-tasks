provider "aws" {
  region = "us-west-2"
  alias  = "oregon"

  default_tags {
    tags = {
      Environment = "Gopal"
      Project     = "oregon-testing"
    }
  }
}