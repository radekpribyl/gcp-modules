locals {
  subscription_name = "${var.service_name}_${var.topic_name}"
}

resource "google_pubsub_subscription" "subscription" {
  project = var.project_id
  name    = local.subscription_name
  topic   = var.topic_id

  labels = {
    owner       = var.owner
    env         = var.environment
    application = var.application
    creator     = var.owner
    dtap        = var.environment
    name        = local.subscription_name
    opco        = var.opco
  }

  ack_deadline_seconds       = var.ack_deadline_seconds
  enable_message_ordering    = var.is_ordered
  message_retention_duration = var.message_retention_duration
  retain_acked_messages      = var.retain_acked_messages

  expiration_policy {
    ttl = ""
  }

  retry_policy {
    minimum_backoff = var.retry_minimum_backoff
    maximum_backoff = var.retry_maximum_backoff
  }

  filter = var.is_filtered ? var.subscription_filter : null

  dynamic "dead_letter_policy" {
    for_each = var.is_dead_letter_enabled ? [1] : []
    content {
      dead_letter_topic     = var.dead_letter_topic_id
      max_delivery_attempts = var.max_delivery_attempts
    }
  }
}