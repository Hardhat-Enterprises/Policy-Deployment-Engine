## 🛡️ Policy Deployment Engine: `looker_instance`

This section provides a concise policy evaluation for the `looker_instance` resource in GCP.

Reference: [Terraform Registry – looker_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/looker_instance)

---

## 1. Argument Reference

### `name`
- Description: (Required) The ID of the instance or a fully qualified identifier for the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_config`
- Description: (Required) Looker Instance OAuth login settings. Structure is [documented below](#nested_oauth_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_settings`
- Description: (Optional) Looker instance Admin settings. Structure is [documented below](#nested_admin_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumer_network`
- Description: (Optional) Network name in the consumer project in the format of: projects/{project}/global/networks/{network} Note that the consumer network may be in a different GCP project than the consumer project that is hosting the Looker Instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deny_maintenance_period`
- Description: (Optional) Maintenance denial period for this instance. You must allow at least 14 days of maintenance availability between any two deny maintenance periods. Structure is [documented below](#nested_deny_maintenance_period).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_config`
- Description: (Optional) Looker instance encryption settings. Structure is [documented below](#nested_encryption_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fips_enabled`
- Description: (Optional) FIPS 140-2 Encryption enablement for Looker (Google Cloud Core).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_window`
- Description: (Optional) Maintenance window for an instance. Maintenance of your instance takes place once a month, and will require your instance to be restarted during updates, which will temporarily disrupt service. Structure is [documented below](#nested_maintenance_window).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `platform_edition`
- Description: (Optional) Platform editions for a Looker instance. Each edition maps to a set of instance features, like its size. Must be one of these values: - LOOKER_CORE_TRIAL: trial instance (Currently Unavailable) - LOOKER_CORE_STANDARD: pay as you go standard instance (Currently Unavailable) - LOOKER_CORE_STANDARD_ANNUAL: subscription standard instance - LOOKER_CORE_ENTERPRISE_ANNUAL: subscription enterprise instance - LOOKER_CORE_EMBED_ANNUAL: subscription embed instance - LOOKER_CORE_NONPROD_STANDARD_ANNUAL: nonprod subscription standard instance - LOOKER_CORE_NONPROD_ENTERPRISE_ANNUAL: nonprod subscription enterprise instance - LOOKER_CORE_NONPROD_EMBED_ANNUAL: nonprod subscription embed instance - LOOKER_CORE_TRIAL_STANDARD: A standard trial edition of Looker (Google Cloud core) product. - LOOKER_CORE_TRIAL_ENTERPRISE: An enterprise trial edition of Looker (Google Cloud core) product. - LOOKER_CORE_TRIAL_EMBED: An embed trial edition of Looker (Google Cloud core) product. Default value is `LOOKER_CORE_TRIAL`. Possible values are: `LOOKER_CORE_TRIAL`, `LOOKER_CORE_STANDARD`, `LOOKER_CORE_STANDARD_ANNUAL`, `LOOKER_CORE_ENTERPRISE_ANNUAL`, `LOOKER_CORE_EMBED_ANNUAL`, `LOOKER_CORE_NONPROD_STANDARD_ANNUAL`, `LOOKER_CORE_NONPROD_ENTERPRISE_ANNUAL`, `LOOKER_CORE_NONPROD_EMBED_ANNUAL`, `LOOKER_CORE_TRIAL_STANDARD`, `LOOKER_CORE_TRIAL_ENTERPRISE`, `LOOKER_CORE_TRIAL_EMBED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_ip_enabled`
- Description: (Optional) Whether private IP is enabled on the Looker instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_config`
- Description: (Optional) Information for Private Service Connect (PSC) setup for a Looker instance. Structure is [documented below](#nested_psc_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_enabled`
- Description: (Optional) Whether Public Service Connect (PSC) is enabled on the Looker instance
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_ip_enabled`
- Description: (Optional) Whether public IP is enabled on the Looker instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reserved_range`
- Description: (Optional) Name of a reserved IP address range within the consumer network, to be used for private service access connection. User may or may not specify this in a request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_metadata`
- Description: (Optional) Metadata about users for a Looker instance. These settings are only available when platform edition LOOKER_CORE_STANDARD is set. There are ten Standard and two Developer users included in the cost of the product. You can allocate additional Standard, Viewer, and Developer users for this instance. It is an optional step and can be modified later. With the Standard edition of Looker (Google Cloud core), you can provision up to 50 total users, distributed across Viewer, Standard, and Developer. Structure is [documented below](#nested_user_metadata).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_domain`
- Description: (Optional) Custom domain settings for a Looker instance. Structure is [documented below](#nested_custom_domain).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The name of the Looker region of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: If setting deletion_policy = "FORCE", the Looker instance will be deleted regardless of its nested resources. If set to "DEFAULT", Looker instances that still have nested resources will return an error. Possible values: DEFAULT, FORCE <a name="nested_oauth_config"></a>The `oauth_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Required) The client ID for the Oauth config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Required) The client secret for the Oauth config. <a name="nested_admin_settings"></a>The `admin_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_email_domains`
- Description: (Optional) Email domain allowlist for the instance. Define the email domains to which your users can deliver Looker (Google Cloud core) content. Updating this list will restart the instance. Updating the allowed email domains from terraform means the value provided will be considered as the entire list and not an amendment to the existing list of allowed email domains. <a name="nested_deny_maintenance_period"></a>The `deny_maintenance_period` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_date`
- Description: (Required) Required. Start date of the deny maintenance period Structure is [documented below](#nested_deny_maintenance_period_start_date).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_date`
- Description: (Required) Required. Start date of the deny maintenance period Structure is [documented below](#nested_deny_maintenance_period_end_date).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time`
- Description: (Required) Required. Start time of the window in UTC time. Structure is [documented below](#nested_deny_maintenance_period_time). <a name="nested_deny_maintenance_period_start_date"></a>The `start_date` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `year`
- Description: (Optional) Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `month`
- Description: (Optional) Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Optional) Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant. <a name="nested_deny_maintenance_period_end_date"></a>The `end_date` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `year`
- Description: (Optional) Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `month`
- Description: (Optional) Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Optional) Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant. <a name="nested_deny_maintenance_period_time"></a>The `time` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Optional) Hours of day in 24 hour format. Should be from 0 to 23.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Optional) Minutes of hour of day. Must be from 0 to 59.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Seconds of minutes of the time. Must normally be from 0 to 59.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. <a name="nested_encryption_config"></a>The `encryption_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) Name of the customer managed encryption key (CMEK) in KMS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_state`
- Description: (Output) Status of the customer managed encryption key (CMEK) in KMS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name_version`
- Description: (Output) Full name and version of the CMEK key currently in use to encrypt Looker data. <a name="nested_maintenance_window"></a>The `maintenance_window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day_of_week`
- Description: (Required) Required. Day of the week for this MaintenanceWindow (in UTC). - MONDAY: Monday - TUESDAY: Tuesday - WEDNESDAY: Wednesday - THURSDAY: Thursday - FRIDAY: Friday - SATURDAY: Saturday - SUNDAY: Sunday Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) Required. Start time of the window in UTC time. Structure is [documented below](#nested_maintenance_window_start_time). <a name="nested_maintenance_window_start_time"></a>The `start_time` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Optional) Hours of day in 24 hour format. Should be from 0 to 23.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Optional) Minutes of hour of day. Must be from 0 to 59.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Seconds of minutes of the time. Must normally be from 0 to 59.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. <a name="nested_psc_config"></a>The `psc_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_vpcs`
- Description: (Optional) List of VPCs that are allowed ingress into the Looker instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `looker_service_attachment_uri`
- Description: (Output) URI of the Looker service attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_attachments`
- Description: (Optional) List of egress service attachment configurations. Structure is [documented below](#nested_psc_config_service_attachments). <a name="nested_psc_config_service_attachments"></a>The `service_attachments` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_status`
- Description: (Output) Status of the service attachment connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_fqdn`
- Description: (Optional) Fully qualified domain name that will be used in the private DNS record created for the service attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_service_attachment_uri`
- Description: (Optional) URI of the service attachment to connect to. <a name="nested_user_metadata"></a>The `user_metadata` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_viewer_user_count`
- Description: (Optional) Number of additional Viewer Users to allocate to the Looker Instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_standard_user_count`
- Description: (Optional) Number of additional Standard Users to allocate to the Looker Instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_developer_user_count`
- Description: (Optional) Number of additional Developer Users to allocate to the Looker Instance. <a name="nested_custom_domain"></a>The `custom_domain` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain`
- Description: (Optional) Domain name
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) Status of the custom domain.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
