resource "google_container_aws_node_pool" "non_compliant_example_1" {
  name      = "nc-container-aws-node-pool"
  cluster   = "projects/my-project-name/locations/australia-southeast1/awsClusters/approved-cluster"
  location  = "australia-southeast1"
  subnet_id = "subnet-approved-private-a"
  version   = "1.29.0-gke.1000"

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  max_pods_constraint {
    max_pods_per_node = 32
  }

  config {
    iam_instance_profile = "approved-profile"

    config_encryption {
      kms_key_arn = "arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id"
    }

    proxy_config {
      secret_arn     = "arn:aws:secretsmanager:ap-southeast-2:012345678910:secret:approved-proxy-secret"
      secret_version = "approved-secret-version"
    }

    root_volume {
      iops        = 3000
      kms_key_arn = "arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id"
      size_gib    = 32
      throughput  = 125
      volume_type = "GP3"
    }

    security_group_ids = ["sg-approved-node-pool"]

    ssh_config {
      ec2_key_pair = "personal-ec2-key-pair"
    }

    labels = {
      env = "test"
    }

    tags = {
      owner = "team@example.com"
    }
  }

  annotations = {
    label-one = "value-one"
  }

  project = "my-project-name"
}
