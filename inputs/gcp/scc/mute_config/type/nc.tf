# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_scc_mute_config" "nc" {
  mute_config_id = "my-config"
  parent         = "organizations/123456789"
  filter         = "category: \"OS_VULNERABILITY\""
}
