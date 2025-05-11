# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_iam_workforce_pool" "c" {
  workforce_pool_id   = "workforce-pool-c"
  parent              = "organizations/org"
  location            = "global"
  display_name        = "Display name"
  description         = "A sample workforce pool."
  disabled            = false
  session_duration    = 7200
  access_restrictions {
    allowed_services {
      domain = "org.domain.xyz"
    }
    disable_programmatic_signin = false
  }
}