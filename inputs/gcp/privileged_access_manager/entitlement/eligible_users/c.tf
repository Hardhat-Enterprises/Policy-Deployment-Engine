resource "google_privileged_access_manager_entitlement" "c123" {
  entitlement_id       = "c123"
  location             = "global"
  max_request_duration = "3600s"
  parent               = "projects/my-project-name"

  requester_justification_config {
    unstructured {}
  }

  eligible_users {
    principals = [
      "group:authorized-admins@example.com",
      "user:admin-user@example.com",
    ]
  }

  privileged_access {
    gcp_iam_access {
      role_bindings {
        role                 = "roles/storage.admin"
        condition_expression = "request.time < timestamp(\"2024-12-31T23:59:59.000Z\")"
      }
      resource      = "//cloudresourcemanager.googleapis.com/projects/my-project-name"
      resource_type = "cloudresourcemanager.googleapis.com/Project"
    }
  }

  approval_workflow {
    manual_approvals {
      require_approver_justification = true
      steps {
        approvals_needed = 1
        approvers {
          principals = [
            "group:approvers@example.com"
          ]
        }
      }
    }
  }
}