resource "google_scc_organization_scc_big_query_export" "nc" {
  organization        = "organizations/123456789"
  big_query_export_id = "unapproved_export"
  dataset             = "projects/my-project/datasets/unapproved_logs"
  filter              = "nc"
}
