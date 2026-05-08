resource "google_container_aws_cluster" "nc" {
  name = "non-compliant-cluster"
  authorization {
    admin_users {
      username = "my@service-account.com"
    }
    admin_groups {
      group = "group@deakin.edu.au"
    }
  }

  aws_region = "my-aws-region"

  control_plane {
    aws_services_authentication {
      role_arn          = "arn:aws:iam::012345678910:role/my--1p-dev-oneplatform"
      role_session_name = "my--1p-dev-session"
    }

    config_encryption {
      kms_key_arn = "arn:aws:kms:my-aws-region:012345678910:key/unapproved-key-id"
    }

    database_encryption {
      kms_key_arn = "arn:aws:kms:my-aws-region:012345678910:key/12345678-1234-1234-1234-123456789111"
    }

    iam_instance_profile = "my--1p-dev-controlplane"
    subnet_ids           = ["subnet-00000000000000000"]
    version              = "1.29.0-gke.1000"
    instance_type        = "t3.medium"

    main_volume {
      iops        = 3000
      kms_key_arn = "arn:aws:kms:my-aws-region:012345678910:key/12345678-1234-1234-1234-123456789111"
      size_gib    = 10
      volume_type = "GP3"
    }

    proxy_config {
      secret_arn     = "arn:aws:secretsmanager:us-west-2:126285863215:secret:proxy_config20210824150329476300000001-ABCDEF"
      secret_version = "12345678-ABCD-EFGH-IJKL-987654321098"
    }

    root_volume {
      iops        = 3000
      kms_key_arn = "arn:aws:kms:my-aws-region:012345678910:key/12345678-1234-1234-1234-123456789111"
      size_gib    = 10
      volume_type = "GP3"
    }

    security_group_ids = ["sg-00000000000000000"]

    ssh_config {
      ec2_key_pair = "my--1p-dev-ssh"
    }

    tags = {
      owner = "my@service-account.com"
    }
  }

  fleet {
    project = "my-project-number"
  }

  location = "us-west1"

  networking {
    pod_address_cidr_blocks     = ["10.2.0.0/16"]
    service_address_cidr_blocks = ["10.1.0.0/16"]
    vpc_id                      = "vpc-00000000000000000"
  }

  annotations = {
    label-one = "value-one"
  }

  description = "A sample aws cluster"
  project     = "my-project-name"
}