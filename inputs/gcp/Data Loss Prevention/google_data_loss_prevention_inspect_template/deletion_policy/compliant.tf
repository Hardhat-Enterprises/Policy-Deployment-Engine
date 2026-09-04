resource "google_data_loss_prevention_inspect_template" "compliant_example_1" {
  parent          = "projects/my-project-name"
  description     = "Compliant example"
  display_name    = "compliant_example_1"
  deletion_policy = "PREVENT"

  inspect_config {
    info_types {
      name = "EMAIL_ADDRESS"
    }
  }
}