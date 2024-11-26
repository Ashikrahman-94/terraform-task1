# Configure provider for the us-east-1 region
provider "aws" {
  region = "us-east-1"
  alias  = "us_east_1"
}

# Configure provider for the us-west-1 region
provider "aws" {
  region = "us-west-1"
  alias  = "us_west_1"
}

# Launch EC2 instance in us-east-1 (East Region)
resource "aws_instance" "instance_us_east" {
  provider = aws.us_east_1

  ami           = "ami-0453ec754f44f9a4a"  # Amazon Linux AMI ID for us-east-1
  instance_type = "t2.micro"
  key_name      = "Aws"                    # Your EC2 key pair name
  tags = {
    Name = "East Region"
  }
}

# Launch EC2 instance in us-west-1 (West Region)
resource "aws_instance" "instance_us_west" {
  provider = aws.us_west_1

  ami           = "ami-038bba9a164eb3dc1"  # Amazon Linux AMI ID for us-west-1
  instance_type = "t2.micro"
  key_name      = "Aws"                    # Your EC2 key pair name
  tags = {
    Name = "West Region"
  }
}
