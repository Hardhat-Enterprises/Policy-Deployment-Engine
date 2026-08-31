resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "non_compliant_explicit_dry_run"
  title  = "service_perimeter"

  use_explicit_dry_run_spec = false
}
