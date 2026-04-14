resource "google_clouddomains_registration" "c" {
  domain_name = "c"
  location    = "global"

  labels = {
    env   = "dev"
    owner = "admin"
  }
}
