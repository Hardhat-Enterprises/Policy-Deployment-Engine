resource "google_privileged_access_manager_entitlement" "c123" {
  entitlement_id       = "c123"
  location             = "global"
  max_request_duration = "3600s"
  parent               = "projects/my-project-name"

  eligible_users {
    principals = ["group:test@google.com"]
  }

  privileged_access {
    gcp_iam_access {
      resource_type = "cloudresourcemanager.googleapis.com/Project"
      resource      = "//cloudresourcemanager.googleapis.com/projects/my-project-name"
      role_bindings {
        role = "roles/privilegedaccessmanager.admin"
      }
    }
  }

  requester_justification_config {
    unstructured {}
  }
}
