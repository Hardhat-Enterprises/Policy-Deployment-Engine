resource "google_iap_web_type_compute_iam_member" "nc1" {
  project = "nc1"
  role    = "roles/owner"        #  too broad
  member  = "user:jane@example.com"
}

resource "google_iap_web_type_compute_iam_member" "nc2" {
  project = "nc2"
  role    = "roles/editor"       #  too broad
  member  = "user:jane@example.com"
}

resource "google_iap_web_type_compute_iam_member" "nc3" {
  project = "nc3"
  role    = "roles/viewer"       #  not the accessor role
  member  = "user:jane@example.com"
}

resource "google_iap_web_type_compute_iam_member" "nc4" {
  project = "nc4"
  role    = "roles/iap.admin"    #  admin, not accessor
  member  = "user:jane@example.com"
}

resource "google_iap_web_type_compute_iam_member" "nc5" {
  project = "nc5"
  role    = "roles/run.invoker"  #  wrong product role
  member  = "user:jane@example.com"
}

resource "google_iap_web_type_compute_iam_member" "nc6" {
  project = "nc6"
  role    = "projects/my-gcp-project/roles/CustomBroadRole"  #  custom
  member  = "user:jane@example.com"
}
