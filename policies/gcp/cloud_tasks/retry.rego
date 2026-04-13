package gcp.cloud_tasks

deny[msg] if {
    input.resource.type == "google_cloud_tasks_queue"

    input.resource.values.retry_config.max_attempts == -1

    msg := "Cloud Tasks must not allow unlimited retries"
}