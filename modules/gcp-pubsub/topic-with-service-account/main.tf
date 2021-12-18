locals {
  sa_account_id = "pub-${var.service_name}-svc"
  sa_name       = "Publisher for topic ${module.topic.topic_name}"
}

resource "google_service_account" "publisher" {
  project      = var.project_id
  account_id   = local.sa_account_id
  display_name = local.sa_name
}

module "topic" {
  source              = "../topic"
  project_id          = var.project_id
  application         = var.application
  environment         = var.environment
  opco                = var.opco
  owner               = var.owner
  service_name        = var.service_name
  topic_version       = var.topic_version
  dead_letter_topic   = false
  ordered             = var.ordered
  persistence_regions = var.persistence_regions
}

resource "google_pubsub_topic_iam_member" "publisher_iam" {
  project = var.project_id
  topic   = module.topic.topic_name
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${google_service_account.publisher.email}"
}