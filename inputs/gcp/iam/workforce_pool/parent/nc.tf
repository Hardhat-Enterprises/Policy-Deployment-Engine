# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_workforce_pool" "nc" {
  workforce_pool_id   = "workforce-pool-nc"
  parent              = "organizations/org-nc"
  location            = "global"
  display_name        = "Display name"
  description         = "A sample workforce pool."
  disabled            = false
  session_duration    = 720
  access_restrictions {
    allowed_services {
      domain = "org.domain.y"
    }
    disable_programmatic_signin = true
  }
}
