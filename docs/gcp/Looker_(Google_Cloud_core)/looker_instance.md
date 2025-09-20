## 🛡️ Policy Deployment Engine: `looker_instance`

This section provides a concise policy evaluation for the `looker_instance` resource in GCP.

Reference: [Terraform Registry – looker_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/looker_instance)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The ID of the instance or a fully qualified identifier for the instance. | true | false | None | None | None |
| `oauth_config` | Looker Instance OAuth login settings. Structure is [documented below](#nested_oauth_config). | true | false | None | None | None |
| `admin_settings` | Looker instance Admin settings. Structure is [documented below](#nested_admin_settings). | false | false | None | None | None |
| `consumer_network` | Network name in the consumer project in the format of: projects/{project}/global/networks/{network} Note that the consumer network may be in a different GCP project than the consumer project that is hosting the Looker Instance. | false | false | None | None | None |
| `deny_maintenance_period` | Maintenance denial period for this instance. You must allow at least 14 days of maintenance availability between any two deny maintenance periods. Structure is [documented below](#nested_deny_maintenance_period). | false | false | None | None | None |
| `encryption_config` | Looker instance encryption settings. Structure is [documented below](#nested_encryption_config). | false | false | None | None | None |
| `fips_enabled` | FIPS 140-2 Encryption enablement for Looker (Google Cloud Core). | false | false | None | None | None |
| `maintenance_window` | Maintenance window for an instance. Maintenance of your instance takes place once a month, and will require your instance to be restarted during updates, which will temporarily disrupt service. Structure is [documented below](#nested_maintenance_window). | false | false | None | None | None |
| `platform_edition` | Platform editions for a Looker instance. Each edition maps to a set of instance features, like its size. Must be one of these values: - LOOKER_CORE_TRIAL: trial instance (Currently Unavailable) - LOOKER_CORE_STANDARD: pay as you go standard instance (Currently Unavailable) - LOOKER_CORE_STANDARD_ANNUAL: subscription standard instance - LOOKER_CORE_ENTERPRISE_ANNUAL: subscription enterprise instance - LOOKER_CORE_EMBED_ANNUAL: subscription embed instance - LOOKER_CORE_NONPROD_STANDARD_ANNUAL: nonprod subscription standard instance - LOOKER_CORE_NONPROD_ENTERPRISE_ANNUAL: nonprod subscription enterprise instance - LOOKER_CORE_NONPROD_EMBED_ANNUAL: nonprod subscription embed instance - LOOKER_CORE_TRIAL_STANDARD: A standard trial edition of Looker (Google Cloud core) product. - LOOKER_CORE_TRIAL_ENTERPRISE: An enterprise trial edition of Looker (Google Cloud core) product. - LOOKER_CORE_TRIAL_EMBED: An embed trial edition of Looker (Google Cloud core) product. Default value is `LOOKER_CORE_TRIAL`. Possible values are: `LOOKER_CORE_TRIAL`, `LOOKER_CORE_STANDARD`, `LOOKER_CORE_STANDARD_ANNUAL`, `LOOKER_CORE_ENTERPRISE_ANNUAL`, `LOOKER_CORE_EMBED_ANNUAL`, `LOOKER_CORE_NONPROD_STANDARD_ANNUAL`, `LOOKER_CORE_NONPROD_ENTERPRISE_ANNUAL`, `LOOKER_CORE_NONPROD_EMBED_ANNUAL`, `LOOKER_CORE_TRIAL_STANDARD`, `LOOKER_CORE_TRIAL_ENTERPRISE`, `LOOKER_CORE_TRIAL_EMBED`. | false | false | None | None | None |
| `private_ip_enabled` | Whether private IP is enabled on the Looker instance. | false | false | None | None | None |
| `psc_config` | Information for Private Service Connect (PSC) setup for a Looker instance. Structure is [documented below](#nested_psc_config). | false | false | None | None | None |
| `psc_enabled` | Whether Public Service Connect (PSC) is enabled on the Looker instance | false | false | None | None | None |
| `public_ip_enabled` | Whether public IP is enabled on the Looker instance. | false | false | None | None | None |
| `reserved_range` | Name of a reserved IP address range within the consumer network, to be used for private service access connection. User may or may not specify this in a request. | false | false | None | None | None |
| `user_metadata` | Metadata about users for a Looker instance. These settings are only available when platform edition LOOKER_CORE_STANDARD is set. There are ten Standard and two Developer users included in the cost of the product. You can allocate additional Standard, Viewer, and Developer users for this instance. It is an optional step and can be modified later. With the Standard edition of Looker (Google Cloud core), you can provision up to 50 total users, distributed across Viewer, Standard, and Developer. Structure is [documented below](#nested_user_metadata). | false | false | None | None | None |
| `custom_domain` | Custom domain settings for a Looker instance. Structure is [documented below](#nested_custom_domain). | false | false | None | None | None |
| `region` | The name of the Looker region of the instance. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `deletion_policy` | If setting deletion_policy = "FORCE", the Looker instance will be deleted regardless of its nested resources. If set to "DEFAULT", Looker instances that still have nested resources will return an error. Possible values: DEFAULT, FORCE | false | false | None | None | None |
| `start_date` |  | false | false | None | None | None |
| `end_date` |  | false | false | None | None | None |
| `time` |  | false | false | None | None | None |
| `start_time` |  | false | false | None | None | None |
| `service_attachments` |  | false | false | None | None | None |

### oauth_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `client_id` | The client ID for the Oauth config. | true | false | None | None | None |
| `client_secret` | The client secret for the Oauth config. | true | false | None | None | None |

### admin_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_email_domains` | Email domain allowlist for the instance. Define the email domains to which your users can deliver Looker (Google Cloud core) content. Updating this list will restart the instance. Updating the allowed email domains from terraform means the value provided will be considered as the entire list and not an amendment to the existing list of allowed email domains. | false | false | None | None | None |

### deny_maintenance_period Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `start_date` | Required. Start date of the deny maintenance period Structure is [documented below](#nested_deny_maintenance_period_start_date). | true | false | None | None | None |
| `end_date` | Required. Start date of the deny maintenance period Structure is [documented below](#nested_deny_maintenance_period_end_date). | true | false | None | None | None |
| `time` | Required. Start time of the window in UTC time. Structure is [documented below](#nested_deny_maintenance_period_time). | true | false | None | None | None |

### encryption_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key_name` | Name of the customer managed encryption key (CMEK) in KMS. | false | false | None | None | None |
| `kms_key_state` | (Output) Status of the customer managed encryption key (CMEK) in KMS. | false | false | None | None | None |
| `kms_key_name_version` | (Output) Full name and version of the CMEK key currently in use to encrypt Looker data. | false | false | None | None | None |

### maintenance_window Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `day_of_week` | Required. Day of the week for this MaintenanceWindow (in UTC). - MONDAY: Monday - TUESDAY: Tuesday - WEDNESDAY: Wednesday - THURSDAY: Thursday - FRIDAY: Friday - SATURDAY: Saturday - SUNDAY: Sunday Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | true | false | None | None | None |
| `start_time` | Required. Start time of the window in UTC time. Structure is [documented below](#nested_maintenance_window_start_time). | true | false | None | None | None |

### psc_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_vpcs` | List of VPCs that are allowed ingress into the Looker instance. | false | false | None | None | None |
| `looker_service_attachment_uri` | (Output) URI of the Looker service attachment. | false | false | None | None | None |
| `service_attachments` | List of egress service attachment configurations. Structure is [documented below](#nested_psc_config_service_attachments). | false | false | None | None | None |

### user_metadata Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `additional_viewer_user_count` | Number of additional Viewer Users to allocate to the Looker Instance. | false | false | None | None | None |
| `additional_standard_user_count` | Number of additional Standard Users to allocate to the Looker Instance. | false | false | None | None | None |
| `additional_developer_user_count` | Number of additional Developer Users to allocate to the Looker Instance. | false | false | None | None | None |

### custom_domain Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `domain` | Domain name | false | false | None | None | None |
| `state` | (Output) Status of the custom domain. | false | false | None | None | None |

### start_date Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `year` | Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year. | false | false | None | None | None |
| `month` | Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day. | false | false | None | None | None |
| `day` | Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant. | false | false | None | None | None |

### end_date Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `year` | Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year. | false | false | None | None | None |
| `month` | Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day. | false | false | None | None | None |
| `day` | Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant. | false | false | None | None | None |

### time Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hours` | Hours of day in 24 hour format. Should be from 0 to 23. | false | false | None | None | None |
| `minutes` | Minutes of hour of day. Must be from 0 to 59. | false | false | None | None | None |
| `seconds` | Seconds of minutes of the time. Must normally be from 0 to 59. | false | false | None | None | None |
| `nanos` | Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. | false | false | None | None | None |

### start_time Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hours` | Hours of day in 24 hour format. Should be from 0 to 23. | false | false | None | None | None |
| `minutes` | Minutes of hour of day. Must be from 0 to 59. | false | false | None | None | None |
| `seconds` | Seconds of minutes of the time. Must normally be from 0 to 59. | false | false | None | None | None |
| `nanos` | Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. | false | false | None | None | None |

### service_attachments Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `connection_status` | (Output) Status of the service attachment connection. | false | false | None | None | None |
| `local_fqdn` | Fully qualified domain name that will be used in the private DNS record created for the service attachment. | false | false | None | None | None |
| `target_service_attachment_uri` | URI of the service attachment to connect to. | false | false | None | None | None |
