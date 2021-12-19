#Common
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
  validation {
    condition = (!can(regex("_", var.opco)))
    error_message = "Variable opco cannot contain _ character."
  }
}

#Specific
variable "service_name" {
  type        = string
  description = "Name of subscribing service"
  validation {
    condition = (!can(regex("_", var.service_name)))
    error_message = "Service name cannot contain _ character."
  }
}

variable "topic_name" {
  type        = string
  description = "Name of topic to subscribe to"
}

variable "topic_id" {
  type        = string
  description = "Id of topic to subscribe to. Needed for cross-project access"
}

variable "is_ordered" {
  type        = bool
  description = "If the topic is ordered then topic is GEO restricted to ensure order"
  default     = false
}

variable "ack_deadline_seconds" {
  type        = number
  description = "This value is the maximum time after a subscriber receives a message before the subscriber should acknowledge the message"
  default     = 10
}

variable "is_filtered" {
  type        = bool
  description = "Indicates if the subscription uses filter"
  default     = false
}

variable "subscription_filter" {
  type        = string
  description = "Defines the filter. It must be set when `filtered` condition applies"
  default     = ""
}

variable "message_retention_duration" {
  type        = string
  description = "How long to retain unacknowledged messages in the subscription's backlog, from the moment a message is published"
  default     = "604800s"
}

variable "retain_acked_messages" {
  type        = bool
  description = "Indicates whether to retain acknowledged messages"
  default     = true
}

variable "retry_minimum_backoff" {
  type        = string
  description = "The minimum delay between consecutive deliveries of a given message"
  default     = "10s"
}

variable "retry_maximum_backoff" {
  type        = string
  description = "The maximum delay between consecutive deliveries of a given message"
  default     = "600s"
}

variable "is_dead_letter_enabled" {
  type        = bool
  description = "Indicates if the subscription has Death Letter Topic"
  default     = false
}

variable "dead_letter_topic_id" {
  type        = string
  description = "Topic ID for dead letter topic - it must be provided if enabled"
  default     = ""
}

variable "max_delivery_attempts" {
  type        = number
  description = "The maximum number of delivery attempts for any message"
  default     = 20
}
