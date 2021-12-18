output "sa_id" {
  value       = google_service_account.subscriber.id
  description = "an identifier for service account"
}

output "sa_email" {
  value       = google_service_account.subscriber.email
  description = "The e-mail address of the service account. This value should be referenced from any google_iam_policy data sources that would grant the service account privileges"
}

output "subscription_id" {
  value       = module.subscription.subscription_id
  description = "an identifier for created subscription"
}

output "subscription_name" {
  value       = module.subscription.subscription_name
  description = "Name for created subscription"
}