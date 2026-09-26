# Tests the deletion_policy argument of google_apigee_flowhook.
# DELETE is non-compliant because it allows Terraform to delete the flow hook.

resource "google_apigee_flowhook" "non_compliant_example_1" {
  org_id          = "example-org"
  environment     = "test"
  flow_hook_point = "PreProxyFlowHook"
  sharedflow      = "security-shared-flow"

  deletion_policy = "DELETE"
}
