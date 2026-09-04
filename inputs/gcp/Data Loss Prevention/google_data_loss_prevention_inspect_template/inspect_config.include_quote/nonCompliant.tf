resource "google_data_loss_prevention_inspect_template" "non_compliant_example_1" {
  parent       = "projects/my-project-name"
  description  = "Non-compliant example"
  display_name = "non_compliant_example_1"

  inspect_config {
    include_quote = true

    info_types {
      name = "EMAIL_ADDRESS"
    }
  }
}