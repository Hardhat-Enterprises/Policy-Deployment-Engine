package hardhat.gcp.oracle_database.cloud_exadata_infrastructure.deletion_protection

deny[msg] {
    input.resource.deletion_protection == false
    msg := "Deletion protection must be enabled to prevent accidental destruction."
}
