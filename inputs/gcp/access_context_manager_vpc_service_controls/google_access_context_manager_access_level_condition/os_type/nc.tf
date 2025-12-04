resource "google_access_context_manager_access_level" "nc" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "nc"
  title  = "nc-os_type"
  basic {
    conditions {
      device_policy {
        os_constraints {
          os_type = "ANDROID"
        }
        os_constraints {
          os_type = "IOS"
        }
        os_constraints {
          os_type = "OS_UNSPECIFIED"
        }
      }
    }
  }
}