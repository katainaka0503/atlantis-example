output "webhook_url" {
  description = "Github webhook URL"
  value       = module.atlantis.atlantis_url_events
}

output "webhook_secret" {
  description = "Github webhook secret"
  value       = module.atlantis.webhook_secret
}
