resource "google_scc_organization_scc_big_query_export" "non_compliant_example_1" {
  organization        = "non_compliant_example_1"
  big_query_export_id = "scc_export_prod_australia-southeast1"
  filter              = ""  
}
resource "google_scc_organization_scc_big_query_export" "non_compliant_example_2" {
  organization        = "non_compliant_example_2"
  big_query_export_id = "scc_export_prod_australia-southeast1"
  filter              = "category:\"Firewall\""  
}
