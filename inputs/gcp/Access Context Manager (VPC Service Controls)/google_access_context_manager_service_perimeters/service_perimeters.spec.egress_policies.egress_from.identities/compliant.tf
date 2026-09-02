resource "google_access_context_manager_service_perimeters" "compliant_example_1" {
  parent = "accessPolicies/123456789"

  service_perimeters {
    name  = "accessPolicies/123456789/servicePerimeters/compliant_example_1"
    title = "compliant_example_1"
    use_explicit_dry_run_spec = true

    spec {
      egress_policies {
        egress_from {
          identities = ["serviceAccount:service-account@project-id.iam.gserviceaccount.com"]
        }
      }
    }
  }
}
