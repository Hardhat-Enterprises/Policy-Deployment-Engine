resource "google_data_loss_prevention_stored_info_type" "non_compliant_example_1" {
  parent          = "projects/my-project-name"
  description     = "Example"
  display_name    = "non_compliant_example_1"
  deletion_policy = "DELETE"

  regex {
    pattern = "patient"
  }
}