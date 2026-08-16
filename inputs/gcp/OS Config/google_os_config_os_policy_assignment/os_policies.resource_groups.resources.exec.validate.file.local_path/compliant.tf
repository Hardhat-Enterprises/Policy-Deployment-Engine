resource "google_os_config_os_policy_assignment" "compliant_example_1" {
  name     = "compliant-example-1"
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
        exec {
          validate {
            interpreter = "SHELL"
            file {
              local_path = "/opt/osconfig/artifact"
            }
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
