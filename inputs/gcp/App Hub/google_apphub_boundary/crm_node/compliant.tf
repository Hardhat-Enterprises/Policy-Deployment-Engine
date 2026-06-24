resource "google_apphub_boundary" "compliant_example_1"{
  location = "global"
  crm_node = "projects/1111111111111"
  project = "PDE"
}

resource "google_apphub_boundary" "compliant_example_2"{
  location = "global"
  crm_node = "folders/22222222222222"
  project = "PDE"
}
