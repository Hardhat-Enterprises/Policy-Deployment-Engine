resource "google_data_loss_prevention_stored_info_type" "compliant_example_1" {
  parent          = "projects/my-project-name"
  description     = "Compliant example"
  display_name    = "compliant_example_1"
  deletion_policy = "PREVENT"

  regex {
    pattern = "patient"
  }
}