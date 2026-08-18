# Tests the continue_on_error argument of google_apigee_flowhook.
# false is compliant because API processing stops if the shared flow fails.

resource "google_apigee_flowhook" "compliant_example_1" {
  org_id          = "example-org"
  environment     = "test"
  flow_hook_point = "PreProxyFlowHook"
  sharedflow      = "security-shared-flow"

  continue_on_error = false
}
