# Invalid prefix
resource "google_iap_app_engine_service_iam_member" "nc1" {
  app_id  = "nc1"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "users:jane@example.com"              #"users:" is not a valid prefix
}

# Broad principals not allowed
resource "google_iap_app_engine_service_iam_member" "nc2" {
  app_id  = "nc2"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "allUsers"                            #too broad for IAP
}

resource "google_iap_app_engine_service_iam_member" "nc3" {
  app_id  = "nc3"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "allAuthenticatedUsers"               #too broad for IAP
}

# Domain-wide grant (disallow if your policy forbids it)
resource "google_iap_app_engine_service_iam_member" "nc4" {
  app_id  = "nc4"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "domain:example.com"                  #domain-scoped access
}

# Malformed emails
resource "google_iap_app_engine_service_iam_member" "nc5" {
  app_id  = "nc5"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "group:eng@@example.com"              #invalid email
}

# Malformed service account
resource "google_iap_app_engine_service_iam_member" "nc6" {
  app_id  = "nc6"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "serviceAccount:not-an-email"         #invalid SA format
}

# Trailing/leading whitespace
resource "google_iap_app_engine_service_iam_member" "nc7" {
  app_id  = "nc7"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = " user:jane@example.com "             #contains spaces
}

resource "google_iap_app_engine_service_iam_member" "nc8" {
  app_id  = "nc8"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@gmail.com"  # external domain; fails corp-domain rule
}