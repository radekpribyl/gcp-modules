locals {
  topic_name = "${var.opco}_${var.environment}_${var.service_name}_${var.topic_version}"
  dlt_name   = "dlt-${var.dlt_subscriber_name}-${local.topic_name}"
}

resource "google_pubsub_topic" "topic" {
  project = var.project_id
  name    = var.is_dead_letter_topic? local.dlt_name : local.topic_name

  labels = {
    owner       = var.owner
    env         = var.environment
    application = var.application
    creator     = var.owner
    dtap        = var.environment
    name        = local.topic_name
    opco        = var.opco
  }

  dynamic "message_storage_policy" {
    for_each = var.is_ordered? [1] : []
    content {
      allowed_persistence_regions = var.persistence_regions
    }
  }

  message_retention_duration = var.is_dead_letter_topic ? var.dlt_message_retention : null
}
