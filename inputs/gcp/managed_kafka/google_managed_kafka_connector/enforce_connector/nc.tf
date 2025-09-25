

resource "google_project" "project_nc" {
  project_id      = "tf-test-noncompliant"
  name            = "tf-test-noncompliant"
  org_id          = "123456789"
  billing_account = "000000-0000000-0000000-000000"
  provider        = google-beta
}

resource "google_managed_kafka_cluster" "gmk_cluster_nc" {
  project    = google_project.project_nc.project_id
  cluster_id = "cluster-nc"
  location   = "us-central1"

  capacity_config {
    vcpu_count   = 2  # ❌ Too low
    memory_bytes = 2147483648
  }

  gcp_config {
    access_config {
      network_configs {
        subnet = "projects/${google_project.project_nc.project_id}/regions/us-central1/subnetworks/default"
      }
    }
  }

  provider = google-beta
}

resource "google_managed_kafka_connect_cluster" "connect_cluster_nc" {
  project             = google_project.project_nc.project_id
  connect_cluster_id  = "connect-cluster-nc"
  kafka_cluster       = "projects/${google_project.project_nc.project_id}/locations/us-central1/clusters/${google_managed_kafka_cluster.gmk_cluster_nc.cluster_id}"
  location            = "us-central1"

  capacity_config {
    vcpu_count   = 2  # ❌ Too low
    memory_bytes = 2147483648
  }

  gcp_config {
    access_config {
      network_configs {
        primary_subnet   = "projects/${google_project.project_nc.project_id}/regions/us-central1/subnetworks/default"
        dns_domain_names = ["public.kafka.nc"]  # ❌ Public DNS
      }
    }
  }

  provider = google-beta
}

resource "google_managed_kafka_connector" "connector_nc" {
  project         = google_project.project_nc.project_id
  connector_id    = "noncompliant-connector"
  connect_cluster = google_managed_kafka_connect_cluster.connect_cluster_nc.connect_cluster_id
  location        = "us-central1"

  configs = {
    "connector.class"  = "com.google.pubsub.kafka.sink.CloudPubSubSinkConnector"
    "name"             = "noncompliant-connector"
    "tasks.max"        = "1"
    "topics"           = "noncompliant-topic"
    "cps.topic"        = "noncompliant-pubsub"
    "cps.project"      = google_project.project_nc.project_id
    "value.converter"  = "org.apache.kafka.connect.storage.StringConverter"
    "key.converter"    = "org.apache.kafka.connect.storage.StringConverter"
  }

  task_restart_policy {
    minimum_backoff = "5s"    # ❌ Too short
    maximum_backoff = "10s"   # ❌ Too short
  }

  provider = google-beta
}
