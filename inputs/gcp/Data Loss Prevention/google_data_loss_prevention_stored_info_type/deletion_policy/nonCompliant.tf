resource "google_data_loss_prevention_stored_info_type" "non_compliant_example_1" {
  parent       = "projects/my-project-name/locations/us-central1"
  description  = "Non-compliant example"
  display_name = "non_compliant_example_1"

  regex {
    pattern = "patient"
  }
}