package hardhat.gcp.oracle_database.cloud_exadata_infrastructure.gcp_oracle_zone

allowed_zones := {"us-east4-b-r2", "us-central1-b-r1", "europe-west4-b-r2"}

deny[msg] {
    not allowed_zones[input.resource.gcp_oracle_zone]
    msg := sprintf("Zone %s is not approved for Exadata infrastructure.", [input.resource.gcp_oracle_zone])
}
