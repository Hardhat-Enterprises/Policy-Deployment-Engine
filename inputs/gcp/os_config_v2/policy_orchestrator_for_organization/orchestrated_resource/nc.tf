resource "google_os_config_v2_policy_orchestrator_for_organization" "nc" {
    policy_orchestrator_id = "p1"
    organization_id = "121623553414"
    state = "ACTIVE"
    action = "UPSERT"

    orchestrated_resource {
        id = "test-orchestrated-resource"
        os_policy_assignment_v1_payload {
            os_policies {
                id = "test-os-policy"
                mode = "MODE_UNSPECIFIED"
                resource_groups {
                    resources {
                        id = "Nmap"
                        repository {
                            apt {
                                uri = "ppa:nmap/nmap"
                                distribution = "focal"
                                components = ["main"]
                                archive_type = "UNSPECIFIED_ARCHIVE_TYPE"
                            }
                        }
                    }
                }
            }
            instance_filter {
                inventories {
                    os_short_name = "Windows"
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