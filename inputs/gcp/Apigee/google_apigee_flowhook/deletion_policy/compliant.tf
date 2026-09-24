# Tests the deletion_policy argument of google_apigee_flowhook.
# PREVENT is compliant because it protects the flow hook from deletion.

resource "google_apigee_flowhook" "compliant_example_1" {
  org_id          = "example-org"
  environment     = "test"
  flow_hook_point = "PreProxyFlowHook"
  sharedflow      = "security-shared-flow"

  deletion_policy = "PREVENT"
}
