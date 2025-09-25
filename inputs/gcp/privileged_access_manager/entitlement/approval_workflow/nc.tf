resource "google_privileged_access_manager_entitlement" "nc123" {
  entitlement_id       = "nc123"
  location             = "global"
  max_request_duration = "43200s"
  parent               = "projects/my-project-name"

  requester_justification_config {
    unstructured {}
  }

  eligible_users {
    principals = ["group:all-users@google.com"]
  }

  privileged_access {
    gcp_iam_access {
      role_bindings {
        role                 = "roles/owner"
        condition_expression = "request.time < timestamp(\"2030-01-01T00:00:00.000Z\")"
      }
      resource      = "//cloudresourcemanager.googleapis.com/projects/my-project-name"
      resource_type = "cloudresourcemanager.googleapis.com/Project"
    }
  }

  additional_notification_targets {
    admin_email_recipients = ["user@example.com"]
  }

  approval_workflow {
    manual_approvals {
      require_approver_justification = false
      steps {
        approvals_needed          = 0
        approver_email_recipients = ["audit-team@example.com"]
        approvers {
          principals = ["group:security-approvers@google.com"]
        }
      }
    }
  }
}
