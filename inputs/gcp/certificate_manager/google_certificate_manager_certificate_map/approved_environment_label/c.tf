resource "google_certificate_manager_certificate_map" "c" {
  name        = "c"
  description = "Compliant certificate map using an approved environment label."

  labels = {
    environment = "prod"
  }
}