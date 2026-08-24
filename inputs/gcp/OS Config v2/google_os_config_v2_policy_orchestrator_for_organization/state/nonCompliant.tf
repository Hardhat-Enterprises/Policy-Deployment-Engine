resource "google_os_config_v2_policy_orchestrator_for_organization" "non_compliant_example_1" {
  policy_orchestrator_id = "google-gcp-production-a1"
  organization_id        = "123456789"

  state  = "STOPPED"
  action = "DELETE"

  orchestrated_resource {
    id = "test-orchestrated-resource-org"

    os_policy_assignment_v1_payload {
      os_policies {
        id   = "test-os-policy-org"
        mode = "VALIDATION"

        allow_no_resource_group_match = true

        resource_groups {
          resources {
            id = "resource-tf"

            file {
              content = "file-content-tf"
              path    = "/etc/example.conf"
              state   = "ABSENT"
            }
          }
        }
      }

      instance_filter {
        inventories {
          os_short_name = "windows-10"
          os_version    = "10.*"
        }
      }

      rollout {
        disruption_budget {
          percent = 100
        }

        min_wait_duration = "60s"
      }
    }
  }

  labels = {
    state = "active"
  }

  orchestration_scope {
    selectors {
      location_selector {
        included_locations = [""]
      }
    }
  }
}