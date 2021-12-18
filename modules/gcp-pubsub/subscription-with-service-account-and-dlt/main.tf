locals {
  sa_account_id = "sub-${var.service_name}-svc"
  sa_name       = "Subscriber for subscription ${module.subscription.subscription_name}"
}

resource "google_service_account" "subscriber" {
  project      = var.project_id
  account_id   = local.sa_account_id
  display_name = local.sa_name
}

module "dead_letter_topic" {
  source            = "../topic"
  project_id        = var.project_id
  application       = var.application
  environment       = var.environment
  opco              = var.opco
  owner             = var.owner
  service_name      = "${var.topic_name}-${var.service_name}"
  topic_version     = "dlt"
  dead_letter_topic = true
  ordered           = false
}

module "subscription" {
  source               = "../subscription"
  project_id           = var.project_id
  application          = var.application
  environment          = var.environment
  opco                 = var.opco
  owner                = var.owner
  service_name         = var.service_name
  topic_id             = var.topic_id
  topic_name           = var.topic_name
  ack_deadline_seconds = var.ack_deadline_seconds
  dead_letter_enabled  = true
  dead_letter_topic_id = module.dead_letter_topic.topic_id
  filtered             = var.filtered
  subscription_filter  = var.subscription_filter
  ordered              = var.ordered
}

resource "google_pubsub_subscription_iam_member" "subscriber_iam" {
  project      = var.project_id
  subscription = module.subscription.subscription_name
  role         = "roles/pubsub.subscriber"
  member       = "serviceAccount:${google_service_account.subscriber.email}"
}
