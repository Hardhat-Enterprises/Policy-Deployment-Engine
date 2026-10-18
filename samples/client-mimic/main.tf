# Mimics a client org's Terraform (GCP Serverless VPC Access).
# In real CI they would: terraform plan -out=tfplan && terraform show -json tfplan > plan.json
# For this demo we ship a matching plan.json so no GCP credentials are required.

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.37.0"
    }
  }
}

provider "google" {
  project = "demo-client-org"
  region  = "australia-southeast1"
}

# PASS against package approved_regions = australia-southeast1 / australia-southeast2
resource "google_vpc_access_connector" "app_connector" {
  name          = "app-connector"
  region        = "australia-southeast1"
  network       = "default"
  ip_cidr_range = "10.8.0.0/28"
  machine_type  = "e2-micro"
  min_instances = 2
  max_instances = 5
  min_throughput = 300
  max_throughput = 300
}

# FAIL — region not in client's whitelist
resource "google_vpc_access_connector" "legacy_connector" {
  name          = "legacy-connector"
  region        = "us-central1"
  network       = "default"
  ip_cidr_range = "10.8.1.0/28"
  machine_type  = "e2-micro"
  min_instances = 2
  max_instances = 5
  min_throughput = 300
  max_throughput = 300
}
