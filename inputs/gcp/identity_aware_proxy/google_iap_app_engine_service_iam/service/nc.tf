# Uppercase letter present (must be lowercase)
resource "google_iap_app_engine_service_iam_member" "nc_service_uppercase" {
  project = "my-gcp-project"
  app_id  = "my-gcp-project"
  service = "DEFAULT"                      #has uppercase
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@example.com"
}

# Underscore is not allowed
resource "google_iap_app_engine_service_iam_member" "nc_service_underscore" {
  project = "my-gcp-project"
  app_id  = "my-gcp-project"
  service = "customer_api"                 #underscore
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@example.com"
}

# Space not allowed
resource "google_iap_app_engine_service_iam_member" "nc_service_space" {
  project = "my-gcp-project"
  app_id  = "my-gcp-project"
  service = "customer api"                 #space
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@example.com"
}

# Must start with a letter (not a digit)
resource "google_iap_app_engine_service_iam_member" "nc_service_leading_digit" {
  project = "my-gcp-project"
  app_id  = "my-gcp-project"
  service = "1api"                         #starts with digit
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@example.com"
}

# Trailing hyphen not allowed
resource "google_iap_app_engine_service_iam_member" "nc_service_trailing_hyphen" {
  project = "my-gcp-project"
  app_id  = "my-gcp-project"
  service = "api-"                         #trailing hyphen
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@example.com"
}

# Too long (DNS-style max is 63 chars)
resource "google_iap_app_engine_service_iam_member" "nc_service_too_long" {
  project = "my-gcp-project"
  app_id  = "my-gcp-project"
  service = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"  #64 chars
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@example.com"
}

# Leading/trailing whitespace
resource "google_iap_app_engine_service_iam_member" "nc_service_trailing_space" {
  project = "my-gcp-project"
  app_id  = "my-gcp-project"
  service = "default "                     #trailing space
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@example.com"
}

# Special character not allowed
resource "google_iap_app_engine_service_iam_member" "nc_service_special_char" {
  project = "my-gcp-project"
  app_id  = "my-gcp-project"
  service = "api@"                         #special char
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@example.com"
}
