variable "project_id" {
  type        = string
  description = "The ID of the project where the composer env will be created"
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
}

variable "service_name" {
  type        = string
  description = "Name of subscribing service"
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

variable "dead_letter_enabled" {
  type        = bool
  description = "Indicates if the subscription has Death Letter Topic"
  default     = false
}

variable "dead_letter_topic_id" {
  type        = string
  description = "Topic ID for dead letter topic - it must be provided if enabled"
  default     = ""
}
