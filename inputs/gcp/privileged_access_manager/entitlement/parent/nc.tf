resource "google_privileged_access_manager_entitlement" "nc" {
  entitlement_id       = "non-compliant-entitlement"
  location             = "global"
  max_request_duration = "43200s"
  parent               = "invalid-parent-string"

  requester_justification_config {
    unstructured {}
  }

  privileged_access {
    gcp_iam_access {
      resource_type = "cloudresourcemanager.googleapis.com/Project"
      resource      = "//cloudresourcemanager.googleapis.com/projects/my-project"

      role_bindings {
        role = "roles/viewer"
      }
    }
  }

  eligible_users {
    principals = ["user:bob@example.com"]
  }
}
