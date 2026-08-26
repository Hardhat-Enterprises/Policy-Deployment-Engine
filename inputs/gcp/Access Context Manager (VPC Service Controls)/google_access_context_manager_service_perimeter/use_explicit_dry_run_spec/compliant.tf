resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_explicit_dry_run"
  title  = "explicit_dry_run_enabled"

  use_explicit_dry_run_spec = true
}
