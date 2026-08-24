resource "google_os_config_v2_policy_orchestrator_for_organization" "compliant_example_1" {
  policy_orchestrator_id = "google-gcp-production-a1"
  organization_id        = "123456789"

  state  = "ACTIVE"
  action = "UPSERT"

  orchestrated_resource {
    id = "test-orchestrated-resource-org"

    os_policy_assignment_v1_payload {
      os_policies {
        id   = "test-os-policy-org"
        mode = "ENFORCEMENT"

        resource_groups {
          resources {
            id = "resource-tf"

            file {
              content = "file-content-tf"
              path    = "/etc/example.conf"
              state   = "PRESENT"
            }
          }
        }
      }

      instance_filter {
        inventories {
          os_short_name = "windows-10"
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
        included_locations = ["us-central1-a"]
      }
    }
  }
}