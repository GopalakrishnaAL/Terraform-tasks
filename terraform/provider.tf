provider "aws" {
  alias  = "oregon"
  region = "us-west-2"

  default_tags {
    tags = {
      Environment = "Gopal"
      Project     = "oregon-testing"
    }
  }
}