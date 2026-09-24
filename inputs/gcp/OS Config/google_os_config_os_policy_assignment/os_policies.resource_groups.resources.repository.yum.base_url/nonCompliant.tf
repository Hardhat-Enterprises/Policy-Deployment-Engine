resource "google_os_config_os_policy_assignment" "non_compliant_example_1" {
  name     = "non-compliant-example-1"
  location = "australia-southeast1"

  instance_filter {
    all = true
  }

  os_policies {
    id   = "policy-1"
    mode = "ENFORCEMENT"

    resource_groups {
      resources {
        id = "resource-1"
        repository {
          yum {
            id       = "example-yum-repo"
            base_url = "http://packages.example.com/yum"
          }
        }
      }
    }
  }

  rollout {
    disruption_budget {
      percent = 100
    }
    min_wait_duration = "60s"
  }
}
