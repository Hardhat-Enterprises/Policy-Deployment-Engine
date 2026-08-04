package hardhat.gcp.oracle_database.cloud_exadata_infrastructure.customer_contacts_email

deny[msg] {
    email := input.resource.properties.customer_contacts.email
    not valid_email_format(email)
    msg := sprintf("Customer contact email %s is invalid or unapproved.", [email])
}

valid_email_format(email) {
    re_match("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$", email)
}
