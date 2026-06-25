resource "google_container_aws_cluster" "non_compliant_example_1" {
  name = "nc-container-aws-cluster"

  authorization {
    admin_users {
      username = "user@deakin.edu.au"
    }

    admin_groups {
      group = "group@deakin.edu.au"
    }
  }

  aws_region = "ap-southeast-2"

  control_plane {
    aws_services_authentication {
      role_arn          = "arn:aws:iam::012345678910:role/approved-multicloud-role"
      role_session_name = "multicloud-service-agent"
    }

    config_encryption {
      kms_key_arn = "arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id"
    }

    database_encryption {
      kms_key_arn = "arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id"
    }

    iam_instance_profile = "approved-control-plane-profile"
    subnet_ids           = ["subnet-approved-private-a", "subnet-approved-private-b"]
    version              = "1.29.0-gke.1000"
    instance_type        = "m5.large"

    main_volume {
      iops        = 3000
      kms_key_arn = "arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id"
      size_gib    = 10
      throughput  = 125
      volume_type = "GP3"
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

    security_group_ids = ["sg-approved-control-plane"]

    ssh_config {
      ec2_key_pair = "approved-ec2-key-pair"
    }

    tags = {
      owner = "team@example.com"
    }
  }

  fleet {
    project = "123456789"
  }

  location = "australia-southeast1"

  networking {
    per_node_pool_sg_rules_disabled = false
    pod_address_cidr_blocks         = ["10.2.0.0/16"]
    service_address_cidr_blocks     = ["10.1.0.0/16"]
    vpc_id                          = "vpc-approved"
  }

  binary_authorization {
    evaluation_mode = "DISABLED"
  }

  annotations = {
    label-one = "value-one"
  }

  description = "A sample Container AWS cluster"
  project     = "my-project-name"
}
