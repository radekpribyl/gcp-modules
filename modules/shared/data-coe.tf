module "omni-talent-profile-subscription-sub1" {
  source       = "../gcp-pubsub/subscription-with-service-account"
  application  = var.application
  environment  = var.environment
  opco         = local.data.opco
  owner        = local.data.owner
  project_id   = lookup(local.data.projects, var.environment)
  service_name = "sub1"
  topic_id     = module.omni-talent-profile-topic.topic_id
  topic_name   = module.omni-talent-profile-topic.topic_name
}

module "omni-talent-profile-subscription-sub2-dlt" {
  source       = "../gcp-pubsub/subscription-with-service-account-and-dlt"
  application  = var.application
  environment  = var.environment
  opco         = local.data.opco
  owner        = local.data.owner
  project_id   = lookup(local.data.projects, var.environment)
  service_name = "sub2"
  ordered      = true
  topic_id     = module.omni-talent-assessment-topic-ordered.topic_id
  topic_name   = module.omni-talent-assessment-topic-ordered.topic_name
}