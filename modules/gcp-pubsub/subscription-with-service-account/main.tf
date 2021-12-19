locals {
  sa_account_id  = "sub-${var.service_name}-svc"
  sa_name        = "Subscriber for subscription ${module.subscription.subscription_name}"
  sa_description = "owner: ${var.owner}"
  topic_parts    = split("_", var.topic_name)
  create_dlt     = (var.is_dead_letter_enabled && length(var.dead_letter_topic_id)<5)? true : false
  dlt_topic_id   = local.create_dlt? module.dead_letter_topic[0].topic_id : var.dead_letter_topic_id
}

resource "google_service_account" "subscriber" {
  project      = var.project_id
  account_id   = local.sa_account_id
  display_name = local.sa_name
  description  = local.sa_description
}

module "dead_letter_topic" {
  count                = local.create_dlt? 1 : 0
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
  source                     = "../subscription"
  #Common
  project_id                 = var.project_id
  environment                = var.environment
  owner                      = var.owner
  application                = var.application
  opco                       = var.opco
  #Specific
  service_name               = var.service_name
  topic_name                 = var.topic_name
  topic_id                   = var.topic_id
  is_ordered                 = var.is_ordered
  ack_deadline_seconds       = var.ack_deadline_seconds
  is_filtered                = var.is_filtered
  subscription_filter        = var.subscription_filter
  message_retention_duration = var.message_retention_duration
  retain_acked_messages      = var.retain_acked_messages
  retry_minimum_backoff      = var.retry_minimum_backoff
  retry_maximum_backoff      = var.retry_maximum_backoff
  is_dead_letter_enabled     = var.is_dead_letter_enabled
  dead_letter_topic_id       = local.dlt_topic_id
  max_delivery_attempts      = var.is_dead_letter_enabled? var.max_delivery_attempts : null
}

resource "google_pubsub_subscription_iam_member" "subscriber_iam" {
  project      = var.project_id
  subscription = module.subscription.subscription_name
  role         = "roles/pubsub.subscriber"
  member       = "serviceAccount:${google_service_account.subscriber.email}"
}
