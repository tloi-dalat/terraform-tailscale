import {
  to = tailscale_acl.this
  id = "acl"
}

import {
  to = tailscale_dns_preferences.this
  id = "dns_preferences"
}

resource "tailscale_acl" "this" {
  acl = file("${path.module}/policy.hujson")
}

resource "tailscale_dns_preferences" "this" {
  magic_dns = true
}
