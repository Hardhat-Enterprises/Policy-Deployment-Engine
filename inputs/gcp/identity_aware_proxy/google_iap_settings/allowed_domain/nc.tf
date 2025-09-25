# Feature disabled
resource "google_iap_settings" "nc1" {
  name = "nc1"
  access_settings {
    allowed_domains_settings {
      enable  = false                  #  must be true
      domains = ["example.com"]
    }
  }
}

# Wildcard domain
resource "google_iap_settings" "nc2" {
  name = "nc2"
  access_settings {
    allowed_domains_settings {
      enable  = true
      domains = ["*"]                  #  wildcard not allowed
    }
  }
}

# Public email domain
resource "google_iap_settings" "nc3" {
  name = "nc3"
  access_settings {
    allowed_domains_settings {
      enable  = true
      domains = ["gmail.com"]          #  public domain
    }
  }
}
