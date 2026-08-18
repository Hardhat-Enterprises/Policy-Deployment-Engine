# Tests the continue_on_error argument of google_apigee_flowhook.
# true is non-compliant because API processing may continue after the shared flow fails.

resource "google_apigee_flowhook" "non_compliant_example_1" {
  org_id          = "example-org"
  environment     = "test"
  flow_hook_point = "PreProxyFlowHook"
  sharedflow      = "security-shared-flow"

  continue_on_error = true
}
