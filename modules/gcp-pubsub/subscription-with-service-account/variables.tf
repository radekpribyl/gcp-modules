variable "project_id" {
  type        = string
  description = "The ID of the project where the composer env will be created"
}

variable "environment" {
  type        = string
  description = "Environment. Supported values: dev, tst, prd"
}

variable "service_name" {
  type        = string
  description = "Name of service which will be publishing messages"
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
}

variable "topic_name" {
  type        = string
  description = "Name of topic to subscribe to"
}

variable "topic_id" {
  type        = string
  description = "Id of topic to subscribe to. Needed for cross-project access"
}

variable "ordered" {
  type        = bool
  description = "If the topic is ordered then topic is GEO restricted to ensure order"
  default     = false
}

variable "ack_deadline_seconds" {
  type        = number
  description = "This value is the maximum time after a subscriber receives a message before the subscriber should acknowledge the message"
  default     = 10
}

variable "filtered" {
  type        = bool
  description = "Indicates if the subscription uses filter"
  default     = false
}

variable "subscription_filter" {
  type        = string
  description = "Defines the filter. It must be set when `filtered` condition applies"
  default     = ""
}
