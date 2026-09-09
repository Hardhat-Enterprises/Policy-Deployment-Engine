resource "google_apigee_datastore" "compliant_example_1" {
  org_id          = "organizations/PDE-Apigee-Project"
  display_name    = "compliant-datastore"
  target_type     = "bigquery"
  deletion_policy = "PREVENT"

  datastore_config {
    project_id   = "example-project"
    dataset_name = "example_dataset"
    table_prefix = "apigee_export"
  }
}
