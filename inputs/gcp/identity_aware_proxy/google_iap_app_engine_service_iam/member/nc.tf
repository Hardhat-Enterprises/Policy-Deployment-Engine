# Invalid prefix
resource "google_iap_app_engine_service_iam_member" "nc_member_bad_prefix" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "users:jane@example.com"              #"users:" is not a valid prefix
}

# Broad principals not allowed
resource "google_iap_app_engine_service_iam_member" "nc_member_allusers" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "allUsers"                            #too broad for IAP
}

resource "google_iap_app_engine_service_iam_member" "nc_member_allauth" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "allAuthenticatedUsers"               #too broad for IAP
}

# Domain-wide grant (disallow if your policy forbids it)
resource "google_iap_app_engine_service_iam_member" "nc_member_domain" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "domain:example.com"                  #domain-scoped access
}

# Malformed emails
resource "google_iap_app_engine_service_iam_member" "nc_member_bad_email" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "group:eng@@example.com"              #invalid email
}

# Malformed service account
resource "google_iap_app_engine_service_iam_member" "nc_member_bad_sa" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "serviceAccount:not-an-email"         #invalid SA format
}

# Trailing/leading whitespace
resource "google_iap_app_engine_service_iam_member" "nc_member_whitespace" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = " user:jane@example.com "             #contains spaces
}

resource "google_iap_app_engine_service_iam_member" "nc_member_external_user" {
  app_id  = "my-gcp-project"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@gmail.com"  # external domain; fails corp-domain rule
}