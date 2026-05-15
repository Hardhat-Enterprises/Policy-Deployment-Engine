
resource "google_vmwareengine_datastore" "nc" {
  name        = "nc"
  location    = "us-east1-a"
  project     = "project-d7f19645-ccba-48ef-bce"
  description = "nc"

  nfs_datastore {
    third_party_file_service {
      file_share = "/share1"
      network    = "projects/project-d7f19645-ccba-48ef-bce/global/networks/nc"
      servers    = ["10.0.0.4"]
    }
  }
}