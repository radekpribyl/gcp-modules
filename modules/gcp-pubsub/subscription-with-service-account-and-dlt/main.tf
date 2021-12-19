locals {
  sa_account_id  = "sub-${var.service_name}-svc"
  sa_name        = "Subscriber for subscription ${module.subscription.subscription_name}"
  sa_description = "owner: ${var.owner}"
  topic_parts    = split("_", var.topic_name)
}

resource "google_service_account" "subscriber" {
  project      = var.project_id
  account_id   = local.sa_account_id
  display_name = local.sa_name
  description  = local.sa_description
}

module "dead_letter_topic" {
  source               = "../topic"
  project_id           = var.project_id
  application          = var.application
  environment          = var.environment
  opco                 = local.topic_parts[0]
  owner                = var.owner
  service_name         = local.topic_parts[2]
  topic_version        = local.topic_parts[3]
  dlt_subscriber_name  = var.service_name
  is_dead_letter_topic = true
  is_ordered           = false
}

module "subscription" {
  source                 = "../subscription"
  project_id             = var.project_id
  application            = var.application
  environment            = var.environment
  opco                   = var.opco
  owner                  = var.owner
  service_name           = var.service_name
  topic_id               = var.topic_id
  topic_name             = var.topic_name
  ack_deadline_seconds   = var.ack_deadline_seconds
  is_dead_letter_enabled = true
  dead_letter_topic_id   = module.dead_letter_topic.topic_id
  is_filtered            = var.filtered
  subscription_filter    = var.subscription_filter
  is_ordered             = var.ordered
}

resource "google_pubsub_subscription_iam_member" "subscriber_iam" {
  project      = var.project_id
  subscription = module.subscription.subscription_name
  role         = "roles/pubsub.subscriber"
  member       = "serviceAccount:${google_service_account.subscriber.email}"
}
