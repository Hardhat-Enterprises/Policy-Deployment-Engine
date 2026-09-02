resource "google_database_migration_service_migration_job" "non_compliant_example_1" {
    display_name          = "non_compliant_example_1"
    location              = "australia-southeast2"
    migration_job_id  = "compliant-migration"
    project               = "gcp-project-id"
    type              = "CONTINUOUS"
    
    vpc_peering_connectivity {
    vpc = "dummy-vpc"
    }
    
    source      = "projects/proj-id/locations/australia-southeast2/connectionProfiles/source"
    destination = "projects/proj-id/locations/australia-southeast2/connectionProfiles/destination"
}
