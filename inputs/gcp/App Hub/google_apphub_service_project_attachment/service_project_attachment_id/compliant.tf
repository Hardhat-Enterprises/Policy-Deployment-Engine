resource "google_apphub_service_project_attachment" "compliant_example_1"{
  project = "PDE"
  service_project_attachment_id = "c1"
}

resource "google_apphub_service_project_attachment" "compliant_example_2"{
  project = "PDE"
  service_project_attachment_id = 123213
}
