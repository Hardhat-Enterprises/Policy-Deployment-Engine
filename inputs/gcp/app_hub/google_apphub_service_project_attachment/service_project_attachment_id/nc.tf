resource "google_apphub_service_project_attachment" "nc1" {
  project = "PDE"
  service_project_attachment_id = "null"
}

resource "google_apphub_service_project_attachment" "nc2" {
  project = "PDE"
  service_project_attachment_id = ""
}

