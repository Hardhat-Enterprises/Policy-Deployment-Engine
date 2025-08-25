resource "google_iap_web_iam_member" "nc_member_bad_prefix" {
  project = "my-gcp-project"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "users:jane@example.com"
}

resource "google_iap_web_iam_member" "nc_member_allusers" {
  project = "my-gcp-project"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "allUsers"
}

resource "google_iap_web_iam_member" "nc_member_allauth" {
  project = "my-gcp-project"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "allAuthenticatedUsers"
}

resource "google_iap_web_iam_member" "nc_member_domain" {
  project = "my-gcp-project"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "domain:example.com"
}

resource "google_iap_web_iam_member" "nc_member_bad_email" {
  project = "my-gcp-project"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "group:eng@@example.com"
}

resource "google_iap_web_iam_member" "nc_member_bad_sa" {
  project = "my-gcp-project"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "serviceAccount:not-an-email"
}

resource "google_iap_web_iam_member" "nc_member_whitespace" {
  project = "my-gcp-project"
  role    = "roles/iap.httpsResourceAccessor"
  member  = " user:jane@example.com "
}

resource "google_iap_web_iam_member" "nc_member_external_user" {
  project = "my-gcp-project"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@gmail.com"
}
