#----root/variables.tf----

variable "aws-region" {
  description = "stored aws region data"
  default     = "us-east-1"
}

variable "project-name" {
  default = "myterraformstatebackupfile"
}
