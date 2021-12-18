locals {
  topic_name = "${var.opco}-${var.environment}-${var.service_name}-${var.topic_version}"
}

resource "google_pubsub_topic" "topic" {
  project = var.project_id
  name    = local.topic_name

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
    for_each = var.ordered? [1] : []
    content {
      allowed_persistence_regions = var.persistence_regions
    }
  }

  message_retention_duration = var.dead_letter_topic ? "2592000s" : null
}
