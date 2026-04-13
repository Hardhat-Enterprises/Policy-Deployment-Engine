resource "google_scc_organization_scc_big_query_export" "nc" {
  organization        = "nc"
  big_query_export_id = "default-test-export"
  filter              = ""
}
resource "google_scc_organization_scc_big_query_export" "nc1" {
  organization        = "nc1"
  big_query_export_id = "tmp-scc-export"
  filter              = "category:\"Firewall\""
}