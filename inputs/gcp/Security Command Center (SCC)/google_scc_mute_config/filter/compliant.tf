resource "google_scc_mute_config" "compliant_example_1" {
  mute_config_id = "compliant_example_1"
  parent         = "organizations/123456789"
  filter         = "category=\"OS_VULNERABILITY\""
  description    = "Mute OS vulnerability findings"
}
