variable "project_id" {
  type        = string
  description = "The ID of the project where the composer env will be created"
}

variable "service_name" {
  type        = string
  description = "Name of the topic to be created"
  validation {
    condition = (!can(regex("_", var.service_name)))
    error_message = "Variable service_name cannot contain _ character."
  }
}

variable "environment" {
  type        = string
  description = "Environment. Supported values: dev, tst, prd"
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

variable "topic_version" {
  type        = string
  description = "The major version of messages in the topic"
  default     = "v1"
  validation {
    condition = (!can(regex("_", var.topic_version)))
    error_message = "Variable topic_version cannot contain _ character."
  }
}

variable "is_ordered" {
  type        = bool
  description = "If the topic is ordered then topic is GEO restricted to ensure order"
  default     = false
}

variable "persistence_regions" {
  type        = list(string)
  description = "A list of IDs of GCP regions where messages that are published to the topic may be persisted in storage"
  default     = ["europe-west3"]

}

variable "is_dead_letter_topic" {
  type        = bool
  description = "Indicates if the topic is Death Letter Topic"
  default     = false
}

variable "dlt_subscriber_name" {
  type        = string
  description = "Name of subscriber - needed for DLT"
  default = ""
}

variable "dlt_message_retention" {
  type = string
  description = "Message retention in secs for DLT topic"
  default = "2592000s"
}


