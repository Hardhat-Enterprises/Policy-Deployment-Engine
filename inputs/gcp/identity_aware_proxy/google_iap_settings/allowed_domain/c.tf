resource "google_iap_settings" "c" {
  name = "c"

  access_settings {
    allowed_domains_settings {
      enable  = true
      domains = ["example.com"]        #  corporate domain only
    }
  }
}
