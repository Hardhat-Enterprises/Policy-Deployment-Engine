# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_scc_mute_config" "c" {
  mute_config_id = "my-config"
  parent         = "organizations/123456789"
  filter         = "category: \"OS_VULNERABILITY\""
}