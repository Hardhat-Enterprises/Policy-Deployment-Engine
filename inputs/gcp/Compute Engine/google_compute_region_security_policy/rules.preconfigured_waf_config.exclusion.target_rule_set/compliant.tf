resource "google_compute_region_security_policy" "compliant_example_1" {
  name            = "compliant-example-1"
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
        target_rule_ids = [
          "owasp-crs-v030001-id942100-sqli"
        ]
      }
    }
  }
}