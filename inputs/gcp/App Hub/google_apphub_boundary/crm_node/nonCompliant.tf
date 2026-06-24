resource "google_apphub_boundary" "non_compliant_example_1"{
  location = "global"
  crm_node = "orgs/333333333333333"
  project = "PDE"
}

resource "google_apphub_boundary" "non_compliant_example_2"{
  location = "global"
  crm_node = "444444444444444"
  project = "PDE"
}
