resource "google_apigee_flowhook" "compliant_example_1" {
  org_id          = "example-org"
  environment     = "test"
  flow_hook_point = "PreProxyFlowHook"
  sharedflow      = "security-shared-flow"

  continue_on_error = false
}
