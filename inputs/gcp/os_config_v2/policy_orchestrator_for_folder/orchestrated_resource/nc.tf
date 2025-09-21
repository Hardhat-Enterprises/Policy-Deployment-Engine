resource "google_folder" "my_folder_nc" {
    provider = google-beta
    display_name        = "po-folder"
    parent              = "organizations/123456789"
    deletion_protection = false
}

resource "google_folder_service_identity" "osconfig_sa_nc" {
    provider = google-beta
    folder  = google_folder.my_folder.folder_id
    service = "osconfig.googleapis.com"
}

resource "google_folder_service_identity" "ripple_sa_nc" {
    provider = google-beta
    folder  = google_folder.my_folder.folder_id
    service = "progressiverollout.googleapis.com"
}

resource "time_sleep" "wait_30_sec_nc" {
    depends_on = [
        google_folder_service_identity.osconfig_sa,
        google_folder_service_identity.ripple_sa,
    ]
    create_duration = "30s"
}

resource "google_folder_iam_member" "iam_osconfig_service_agent_nc" {
    provider = google-beta
    depends_on = [time_sleep.wait_30_sec]
    folder = google_folder.my_folder.folder_id
    role   = "roles/osconfig.serviceAgent"
    member = google_folder_service_identity.osconfig_sa.member
}

resource "google_folder_iam_member" "iam_osconfig_rollout_service_agent_nc" {
    provider = google-beta
    depends_on = [google_folder_iam_member.iam_osconfig_service_agent]
    folder     = google_folder.my_folder.folder_id
    role       = "roles/osconfig.rolloutServiceAgent"
    member     = "serviceAccount:service-folder-${google_folder.my_folder.folder_id}@gcp-sa-osconfig-rollout.iam.gserviceaccount.com"
}

resource "google_folder_iam_member" "iam_progressiverollout_service_agent_nc" {
    provider = google-beta
    depends_on = [google_folder_iam_member.iam_osconfig_rollout_service_agent]
    folder = google_folder.my_folder.folder_id
    role   = "roles/progressiverollout.serviceAgent"
    member = google_folder_service_identity.ripple_sa.member
}

resource "time_sleep" "wait_3_min_nc" {
    depends_on = [google_folder_iam_member.iam_progressiverollout_service_agent]
    create_duration = "180s"
}

resource "google_os_config_v2_policy_orchestrator_for_folder" "nc" {
    provider = google-beta
    depends_on = [time_sleep.wait_3_min]

    policy_orchestrator_id = "po-folder"
    folder_id = google_folder.my_folder.folder_id

    state = "ACTIVE"
    action = "UPSERT"

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