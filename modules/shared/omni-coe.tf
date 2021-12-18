module "omni-talent-profile-topic" {
  source        = "../gcp-pubsub/topic-with-service-account"
  application   = var.application
  environment   = var.environment
  opco          = local.omni.opco
  owner         = local.omni.owner
  project_id    = lookup(local.omni.projects, var.environment)
  service_name  = "talent-profile"
  topic_version = "v1"
}

module "omni-talent-assessment-topic-ordered" {
  source        = "../gcp-pubsub/topic-with-service-account"
  application   = var.application
  environment   = var.environment
  opco          = local.omni.opco
  owner         = local.omni.owner
  project_id    = lookup(local.omni.projects, var.environment)
  service_name  = "talent-assessment"
  topic_version = "v1"
  ordered       = true
}