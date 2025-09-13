resource "google_privileged_access_manager_entitlement" "nc123" {
  entitlement_id       = "nc123"
  location             = "australia-southeast1"
  max_request_duration = "43200s"
  parent               = "projects/my-project-name"

  requester_justification_config {
    unstructured {}
  }

  eligible_users {
    principals = ["group:test@google.com"]
  }

  privileged_access {
    gcp_iam_access {
      role_bindings {
        role                 = "roles/storage.admin"
        condition_expression = "request.time < timestamp(\"2024-04-23T18:30:00.000Z\")"
      }
      resource      = "//cloudresourcemanager.googleapis.com/projects/my-project-name"
      resource_type = "cloudresourcemanager.googleapis.com/Project"
    }
  }
}
