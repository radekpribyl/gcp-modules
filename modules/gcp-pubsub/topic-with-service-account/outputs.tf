output "sa_id" {
  value       = google_service_account.publisher.id
  description = "an identifier for service account"
}

output "sa_email" {
  value       = google_service_account.publisher.name
  description = "The e-mail address of the service account. This value should be referenced from any google_iam_policy data sources that would grant the service account privileges"
}

output "topic_id" {
  value       = module.topic.topic_id
  description = "an identifier for created topic"
}

output "topic_name" {
  value       = module.topic.topic_name
  description = "Name for created topic"
}