resource "google_scc_organization_scc_big_query_export" "nc" {
  organization        = "nc"
  big_query_export_id = "tmp-scc-export"
  dataset             = "bad_dataset"
}
