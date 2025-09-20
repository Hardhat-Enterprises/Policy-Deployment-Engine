resource "google_privileged_access_manager_entitlement" "nc123" {
  entitlement_id       = "nc123"
  location             = "global"
  max_request_duration = "3600s"
  parent               = "projects/my-project-name"

  requester_justification_config {
    unstructured {}
  }

  eligible_users {
    principals = [
      "allUsers"  
    ]
  }

  privileged_access {
    gcp_iam_access {
      role_bindings {
        role                 = "roles/owner"
        condition_expression = "request.time < timestamp(\"2099-12-31T23:59:59.000Z\")"
      }
      resource      = "//cloudresourcemanager.googleapis.com/projects/my-project-name"
      resource_type = "cloudresourcemanager.googleapis.com/Project"
    }
  }

  approval_workflow {
    manual_approvals {
      require_approver_justification = false
      steps {
        approvals_needed = 0
        approvers {
          principals = [
            "user:same-user@example.com"
          ]
        }
      }
    }
  }
}