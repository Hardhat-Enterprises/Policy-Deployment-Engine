resource "google_scc_mute_config" "non_compliant_example_1" {
  mute_config_id = "non_compliant_example_1"
  parent         = "organizations/123456789"
  filter         = "category=\"CRYPTOGRAPHY\""
  description    = "Mute OS vulnerability findings"
}
