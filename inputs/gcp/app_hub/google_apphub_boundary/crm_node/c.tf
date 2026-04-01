resource "google_apphub_boundary" "c1"{
  location = "global"
  crm_node = "projects/1111111111111"
  project = "PDE"
}

resource "google_apphub_boundary" "c2"{
  location = "global"
  crm_node = "folders/22222222222222"
  project = "PDE"
}
