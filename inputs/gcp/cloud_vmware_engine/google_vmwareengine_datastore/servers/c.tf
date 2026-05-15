
resource "google_vmwareengine_datastore" "c" {
  name        = "c"
  location    = "us-west1-a"
  project     = "project-d7f19645-ccba-48ef-bce"
  description = "c"

  nfs_datastore {
    third_party_file_service {
      file_share = "/share1"
      network    = "projects/project-d7f19645-ccba-48ef-bce/global/networks/c"
      servers    = ["10.0.0.4"]
    }
  }
}