resource "google_access_context_manager_access_level" "nc" {
    parent = "accessPolicies/123456789012"
    name   = "accessLevels/compliant-example-nc"
    title  = "Compliant Access Level"

    basic {
      combining_function = "OR"
      
    conditions {
      members = ["domain:deakin.edu.au"]
    }
  }
}