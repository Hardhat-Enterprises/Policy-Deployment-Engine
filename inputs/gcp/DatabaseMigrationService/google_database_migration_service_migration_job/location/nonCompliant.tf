resource "google_database_migration_service_migration_job" "non_compliant_example_1" {
    display_name          = "non_compliant_example_1"
    location              = "us-central1"
    migration_job_id  = "compliant-migration"
    project               = "gcp-project-id"
    type              = "CONTINUOUS"
    
    vpc_peering_connectivity {
    vpc = "dummy-vpc"
    }
    
    source      = "projects/proj-id/locations/us-central1/connectionProfiles/source"
    destination = "projects/proj-id/locations/us-central1/connectionProfiles/destination"
}
