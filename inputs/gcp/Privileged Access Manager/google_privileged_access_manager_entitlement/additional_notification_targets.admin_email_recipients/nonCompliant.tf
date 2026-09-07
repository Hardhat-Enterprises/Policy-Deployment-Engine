resource "google_privileged_access_manager_entitlement" "non_compliant_example_1" {
  entitlement_id       = "compliant-example-1"
  location             = "global"
  max_request_duration = "43200s"
  parent               = "projects/my-project-name"

  requester_justification_config {
    unstructured {}
  }

  eligible_users {
    principals = ["group:approvers@google.com"]
  }

  privileged_access {
    gcp_iam_access {
      role_bindings {
        role                 = "roles/storage.admin"
        condition_expression = "request.time < timestamp(\"2024-12-31T23:59:59.999Z\")"
      }
      resource      = "//cloudresourcemanager.googleapis.com/projects/my-project-name"
      resource_type = "cloudresourcemanager.googleapis.com/Project"
    }
  }

  additional_notification_targets {
    admin_email_recipients     = []
    requester_email_recipients = []
  }

  approval_workflow {
    manual_approvals {
      require_approver_justification = true
      steps {
        approvals_needed          = 1
        approver_email_recipients = ["audit-team@example.com"]
        approvers {
          principals = ["group:security-approvers@google.com"]
        }
      }
    }
  }
}

