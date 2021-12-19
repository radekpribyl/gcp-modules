#Common
variable "project_id" {
  type        = string
  description = "The ID of the project where the composer env will be created"
}

variable "environment" {
  type        = string
  description = "Environment. Supported values: dev, qa, prod"
}

variable "owner" {
  type        = string
  description = "The owner of the resource"
}

variable "application" {
  type        = string
  description = "The name of the folder the project resides in within which the function is created"
}

variable "opco" {
  type        = string
  description = "The randstad abbreviation for the operating company, i.e. df"
  validation {
    condition = (!can(regex("_", var.opco)))
    error_message = "Variable opco cannot contain _ character."
  }
}

#Specific
variable "service_name" {
  type        = string
  description = "Name of service which will be publishing messages"
  validation {
    condition = (!can(regex("_", var.service_name)))
    error_message = "Service name cannot contain _ character."
  }
}

variable "topic_version" {
  type        = string
  description = "The major version of messages in the topic"
  default     = "v1"
}

variable "is_ordered" {
  type = bool
  description = "If the topic is ordered then topic is GEO restricted to ensure order"
  default = false
}

variable "persistence_regions" {
  type = list(string)
  description = "A list of IDs of GCP regions where messages that are published to the topic may be persisted in storage"
  default = [ "europe-west3" ]
}

