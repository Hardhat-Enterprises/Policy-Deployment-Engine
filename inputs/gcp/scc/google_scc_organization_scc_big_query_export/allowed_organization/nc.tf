resource "google_scc_organization_scc_big_query_export" "nc" {
  organization        = "organizations/000000000"
  big_query_export_id = "scc_export_bad"
  dataset             = "projects/my-project/datasets/unapproved_logs"
  filter              = "nc"
}
