# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secret_manager_secret" "c" {
    secret_id = "compliant-secret"
    replication {
        auto{}
    }
    labels = {
        environment = "prod"
        team        = "devops"
    }
}