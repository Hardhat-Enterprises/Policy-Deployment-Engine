package bigquery

deny contains msg if {
    input.resource.type == "google_bigquery_connection"
    not input.resource.values.kms_key_name

    msg := "BigQuery Connection must use KMS encryption (kms_key_name is missing)"
}

deny contains msg if {
    input.resource.type == "google_bigquery_connection"
    input.resource.values.cloud_sql
    input.resource.values.cloud_sql.credential.username == ""

    msg := "Username must not be empty"
}

deny contains msg if {
    input.resource.type == "google_bigquery_connection"
    input.resource.values.cloud_sql
    input.resource.values.cloud_sql.credential.password == ""

    msg := "Password must not be empty"
}