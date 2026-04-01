resource "google_apphub_service_project_attachment" "c1"{
  project = "PDE"
  service_project_attachment_id = "c1"
}

resource "google_apphub_service_project_attachment" "c2"{
  project = "PDE"
  service_project_attachment_id = 123213
}
