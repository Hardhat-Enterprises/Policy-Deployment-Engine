# Invalid prefix
resource "google_iap_app_engine_service_iam_member" "non_compliant_example_1" {
  app_id  = "non_compliant_example_1"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "users:jane@example.com"              #"users:" is not a valid prefix
}

# Broad principals not allowed
resource "google_iap_app_engine_service_iam_member" "non_compliant_example_2" {
  app_id  = "non_compliant_example_2"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "allUsers"                            #too broad for IAP
}

resource "google_iap_app_engine_service_iam_member" "non_compliant_example_3" {
  app_id  = "non_compliant_example_3"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "allAuthenticatedUsers"               #too broad for IAP
}

# Domain-wide grant (disallow if your policy forbids it)
resource "google_iap_app_engine_service_iam_member" "non_compliant_example_4" {
  app_id  = "non_compliant_example_4"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "domain:example.com"                  #domain-scoped access
}

# Malformed emails
resource "google_iap_app_engine_service_iam_member" "non_compliant_example_5" {
  app_id  = "non_compliant_example_5"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "group:eng@@example.com"              #invalid email
}

# Malformed service account
resource "google_iap_app_engine_service_iam_member" "non_compliant_example_6" {
  app_id  = "non_compliant_example_6"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "serviceAccount:not-an-email"         #invalid SA format
}

# Trailing/leading whitespace
resource "google_iap_app_engine_service_iam_member" "non_compliant_example_7" {
  app_id  = "non_compliant_example_7"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = " user:jane@example.com "             #contains spaces
}

resource "google_iap_app_engine_service_iam_member" "non_compliant_example_8" {
  app_id  = "non_compliant_example_8"
  service = "default"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@gmail.com"  # external domain; fails corp-domain rule
}
