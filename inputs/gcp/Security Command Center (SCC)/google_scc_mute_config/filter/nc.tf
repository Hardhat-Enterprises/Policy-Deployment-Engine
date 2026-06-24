resource "google_scc_mute_config" "nc" {
  mute_config_id = "nc"
  parent         = "organizations/123456789"
  filter         = "category=\"CRYPTOGRAPHY\""
  description    = "This improperly mutes cryptographic issues"
}
