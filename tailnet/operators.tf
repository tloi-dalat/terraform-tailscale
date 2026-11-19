resource "tailscale_oauth_client" "operator" {
  for_each = local.operators

  description = "k8s operator ${each.key}"
  scopes      = ["devices:core", "auth_keys", "services"]
  tags        = each.value.tags

  depends_on = [tailscale_acl.this]
}

resource "infisical_secret" "operator_client_id" {
  for_each = local.operators

  workspace_id = var.infisical_project_id
  env_slug     = each.value.infisical.environment
  folder_path  = each.value.infisical.path
  name         = "CLIENT_ID"
  value        = tailscale_oauth_client.operator[each.key].id
}

resource "infisical_secret" "operator_client_secret" {
  for_each = local.operators

  workspace_id = var.infisical_project_id
  env_slug     = each.value.infisical.environment
  folder_path  = each.value.infisical.path
  name         = "CLIENT_SECRET"
  value        = tailscale_oauth_client.operator[each.key].key
}
