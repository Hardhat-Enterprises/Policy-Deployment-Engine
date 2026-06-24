resource "google_privileged_access_manager_entitlement" "c123" {
  entitlement_id       = "c123"
  location             = "global"
  parent               = "projects/my-project"
  max_request_duration = "3600s"

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
    principals = ["user:alice@example.com"]
  }
}

