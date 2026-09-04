resource "google_data_loss_prevention_inspect_template" "non_compliant_example_1" {
  parent          = "projects/my-project-name"
  description     = "Non-compliant example"
  display_name    = "non_compliant_example_1"
  deletion_policy = "DELETE"

  inspect_config {
    info_types {
      name = "EMAIL_ADDRESS"
    }
  }
}