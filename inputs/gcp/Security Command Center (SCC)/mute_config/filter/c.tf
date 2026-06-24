resource "google_scc_mute_config" "c" {
  mute_config_id = "c"
  parent         = "organizations/123456789"
  filter         = "category=\"OS_VULNERABILITY\""
  description    = "Mute OS vulnerability findings"
}
