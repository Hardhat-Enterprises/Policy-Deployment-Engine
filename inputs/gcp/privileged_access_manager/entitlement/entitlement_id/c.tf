resource "google_privileged_access_manager_entitlement" "c" {
  entitlement_id       = "compliant-entitlement"
  location             = "global"
  max_request_duration = "3600s"
  parent               = "projects/my-project-name"

  requester_justification_config {
    unstructured {}
  }

  eligible_users {
    principals = [
      "group:users@example.com"
    ]
  }

  privileged_access {
    gcp_iam_access {
      role_bindings {
        role = "roles/viewer"
      }
      resource      = "//cloudresourcemanager.googleapis.com/projects/my-project"
      resource_type = "cloudresourcemanager.googleapis.com/Project"
    }
  }
}
