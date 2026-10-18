resource "google_compute_region_security_policy" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  project         = "pde-project-vindya"
  region          = "australia-southeast1"
  type            = "CLOUD_ARMOR"
  deletion_policy = "PREVENT"

  rules {
    action   = "deny(403)"
    priority = 1000

    match {
      expr {
        expression = "evaluatePreconfiguredWaf('owasp-crs-v030001')"
      }
    }

    preconfigured_waf_config {
      exclusion {
        target_rule_set = "owasp-crs-v030001"

        request_cookie {
          operator = "EQUALS_ANY"
        }
      }
    }
  }
}