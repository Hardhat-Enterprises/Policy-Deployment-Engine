resource "google_scc_organization_scc_big_query_export" "c" {
  organization        = "organizations/123456789"
  big_query_export_id = "scc_export_prod_australia-southeast1"
  dataset             = "projects/my-project/datasets/security_exports"
  filter              = "c"
}
