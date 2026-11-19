output "operator_client_ids" {
  description = "Cluster → OAuth client ID of its Tailscale operator"
  value       = { for name, c in tailscale_oauth_client.operator : name => c.id }
}
