resource "google_project" "project-nc" {
  project_id      = "my-project"
  name            = "my-project"
  org_id          = "123456789"
  billing_account = "000000-0000000-0000000-000000"
  deletion_policy = "DELETE"
}

resource "google_access_context_manager_access_policy" "access-policy-nc" {
  parent = "organizations/${google_project.project-nc.org_id}"
  title  = "my policy"
}

resource "google_access_context_manager_access_level" "test-access-nc" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy-nc.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access-policy-nc.name}/accessLevels/chromeos_no_lock"
  title  = "chromeos_no_lock"
  basic {
    conditions {
      device_policy {
        require_screen_lock = true
        os_constraints {
          os_type = "DESKTOP_CHROME_OS"
        }
      }
      regions = [
        "CH",
        "IT",
        "US",
      ]
    }
  }
}

resource "google_iam_access_boundary_policy" "nc" {
    name = "abp-c"
    parent = ""
    rules {
      description = ""
      access_boundary_rule {
        available_resource = ""
        available_permissions = [""]
        availability_condition {
          expression = ""
          title = ""
          description = "" 
          location = ""
        }
      }
    }
    display_name = ""
}