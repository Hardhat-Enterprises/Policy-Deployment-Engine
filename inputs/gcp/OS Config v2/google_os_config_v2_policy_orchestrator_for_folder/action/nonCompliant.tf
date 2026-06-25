resource "google_os_config_v2_policy_orchestrator_for_folder" "non_compliant_example_1" {

    policy_orchestrator_id = "po-folder"
    folder_id = "folders/123456789"

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
                        id = "Nmap"
                        repository {
                            apt {
                                uri = "ppa:nmap/nmap"
                                distribution = "focal"
                                components = ["main"]
                                archive_type = "DEB_SRC"
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
    orchestration_scope {
        selectors {
            location_selector {
                included_locations = [""]
            }
        }
    }
}
