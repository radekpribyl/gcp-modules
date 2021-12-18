variable "environment" {
  type        = string
  description = "Environment. Supported values: dev, tst, prd"
}

variable "application" {
  type        = string
  description = "The name of the folder the project resides in within which the function is created"
}