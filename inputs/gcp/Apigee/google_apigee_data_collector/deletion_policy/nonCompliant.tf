resource "google_apigee_data_collector" "non_compliant_example_1" {
  org_id            = "organizations/PDE-Apigee-Project"
  data_collector_id = "dc_example_test"
  type              = "STRING"
  description       = "Example data collector"
  deletion_policy   = "DELETE"
}
