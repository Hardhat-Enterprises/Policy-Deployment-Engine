resource "google_iap_web_type_compute_iam_member" "non_compliant_example_1" {
  project = "nc1"
  role    = "roles/owner"        #  too broad
  member  = "user:jane@example.com"
}

resource "google_iap_web_type_compute_iam_member" "non_compliant_example_2" {
  project = "nc2"
  role    = "roles/editor"       #  too broad
  member  = "user:jane@example.com"
}

resource "google_iap_web_type_compute_iam_member" "non_compliant_example_3" {
  project = "nc3"
  role    = "roles/viewer"       #  not the accessor role
  member  = "user:jane@example.com"
}

resource "google_iap_web_type_compute_iam_member" "non_compliant_example_4" {
  project = "nc4"
  role    = "roles/iap.admin"    #  admin, not accessor
  member  = "user:jane@example.com"
}

resource "google_iap_web_type_compute_iam_member" "non_compliant_example_5" {
  project = "nc5"
  role    = "roles/run.invoker"  #  wrong product role
  member  = "user:jane@example.com"
}

resource "google_iap_web_type_compute_iam_member" "non_compliant_example_6" {
  project = "nc6"
  role    = "projects/my-gcp-project/roles/CustomBroadRole"  #  custom
  member  = "user:jane@example.com"
}
