output "topic_id" {
  value       = google_pubsub_topic.topic.id
  description = "an identifier for created topic"
}

output "topic_name" {
  value       = google_pubsub_topic.topic.name
  description = "Name for created topic"
}