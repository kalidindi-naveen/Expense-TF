variable "project_name" {
  type    = string
  default = "expense"
}

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "expense",
    Environment = "dev",
    Terraform   = "true"
  }
}

variable "public_subnet_cidrs" {
  default = ["100.0.1.0/24", "100.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["100.0.11.0/24", "100.0.12.0/24"]
}

variable "database_subnet_cidrs" {
  default = ["100.0.21.0/24", "100.0.22.0/24"]
}

variable "enable_peering" {
  default = true
}