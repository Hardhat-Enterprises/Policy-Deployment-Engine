resource "google_container_aws_node_pool" "c" {
  name = "compliant-node-pool"
  autoscaling {
    max_node_count = 5
    min_node_count = 1
  }

  cluster = "cluster"

  config {
    config_encryption {
      kms_key_arn = "arn:aws:kms:my-aws-region:012345678910:key/12345678-1234-1234-1234-123456789111"
    }

    iam_instance_profile = "approved-profile"
    instance_type        = "t3.medium"

    labels = {
      label-one = "value-one"
    }

    root_volume {
      iops        = 3000
      kms_key_arn = "arn:aws:kms:my-aws-region:012345678910:key/12345678-1234-1234-1234-123456789111"
      size_gib    = 10
      volume_type = "gp3"
    }

    security_group_ids = ["sg-00000000000000000"]

    proxy_config {
      secret_arn     = "arn:aws:secretsmanager:us-west-2:126285863215:secret:proxy_config20210824150329476300000001-ABCDEF"
      secret_version = "12345678-ABCD-EFGH-IJKL-987654321098"
    }

    ssh_config {
      ec2_key_pair = "my--1p-dev-ssh"
    }

    tags = {
      tag-one = "value-one"
    }

    taints {
      effect = "prefer_no_schedule"
      key    = "taint-key"
      value  = "taint-value"
    }
  }

  location = "us-west1"

  max_pods_constraint {
    max_pods_per_node = 110
  }

  subnet_id = "subnet-00000000000000000"
  version   = "1.29.0-gke.1000"

  annotations = {
    label-one = "value-one"
  }

  project = "my-project-name"
}