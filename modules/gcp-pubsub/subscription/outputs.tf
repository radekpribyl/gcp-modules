output "subscription_id" {
  value       = google_pubsub_subscription.subscription.id
  description = "an identifier for created topic"
}

output "subscription_name" {
  value       = google_pubsub_subscription.subscription.name
  description = "Name for created topic"
}