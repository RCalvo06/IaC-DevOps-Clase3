
variable "instance-type" {

    type = string
    description = "Ingrese el tipo de instancia de AWS"
    default = "t2.micro"
    
  
}

variable "ami_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default = "ami-026b57f3c383c2eec"

  validation {
    condition     = length(var.ami_id) > 4 && substr(var.ami_id, 0, 4) == "ami-"
    error_message = "The ami_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

resource "aws_instance" "ec1" {
  #Block Body

  ami           = var.ami_id
  instance_type = var.instance-type
  
  tags = {
    Name = "Test-Terraform-Tarea4"
  }


}
