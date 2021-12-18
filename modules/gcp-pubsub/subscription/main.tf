locals {
  subscription_name = "${var.service_name}-${var.topic_name}"
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
  enable_message_ordering    = var.ordered
  message_retention_duration = "604800s"
  retain_acked_messages      = true

  expiration_policy {
    ttl = ""
  }

  retry_policy {
    minimum_backoff = "10s"
    maximum_backoff = "600s"
  }

  filter = var.filtered ? var.subscription_filter : null

  dynamic "dead_letter_policy" {
    for_each = var.dead_letter_enabled ? [1] : []
    content {
      dead_letter_topic     = var.dead_letter_topic_id
      max_delivery_attempts = 20
    }
  }
}