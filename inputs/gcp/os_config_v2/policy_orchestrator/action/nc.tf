resource "google_os_config_v2_policy_orchestrator" "nc" {
    policy_orchestrator_id = "p1"
    project = "121623553414"
    state = "ACTIVE"
    action = "DELETE"

    orchestrated_resource {
        id = "test-orchestrated-resource"
        os_policy_assignment_v1_payload {
            os_policies {
                id = "test-os-policy"
                mode = "VALIDATION"
                resource_groups {
                    resources {
                        id = "resource-tf"
                    }
                }
            }
            instance_filter {
                inventories {
                    os_short_name = "Debian"
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
}