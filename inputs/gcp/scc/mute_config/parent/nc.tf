resource "google_scc_mute_config" "nc" {
  mute_config_id = "nc"
  parent         = "organizations/000000000"
  filter         = "category=\"OS_VULNERABILITY\""
}
