## 🛡️ Policy Deployment Engine: `network_management_vpc_flow_logs_config`

This section provides a concise policy evaluation for the `network_management_vpc_flow_logs_config` resource in GCP.

Reference: [Terraform Registry – network_management_vpc_flow_logs_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_management_vpc_flow_logs_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. See documentation for resource type `networkmanagement.googleapis.com/VpcFlowLogsConfig`. | true | None | None |
| `vpc_flow_logs_config_id` | Required. ID of the `VpcFlowLogsConfig`. | true | None | None |
| `description` | Optional. The user-supplied description of the VPC Flow Logs configuration. Maximum of 512 characters. | false | None | None |
| `state` | Optional. The state of the VPC Flow Log configuration. Default value is ENABLED. When creating a new configuration, it must be enabled.   Possible | false | None | None |
| `aggregation_interval` | Optional. The aggregation interval for the logs. Default value is INTERVAL_5_SEC.   Possible values:  AGGREGATION_INTERVAL_UNSPECIFIED INTERVAL_5_SEC INTERVAL_30_SEC INTERVAL_1_MIN INTERVAL_5_MIN INTERVAL_10_MIN INTERVAL_15_MIN" | false | None | None |
| `flow_sampling` | Optional. The value of the field must be in (0, 1]. The sampling rate of VPC Flow Logs where 1.0 means all collected logs are reported. Setting the sampling rate to 0.0 is not allowed. If you want to disable VPC Flow Logs, use the state field instead. Default value is 1.0. | false | None | None |
| `metadata` | Optional. Configures whether all, none or a subset of metadata fields should be added to the reported VPC flow logs. Default value is INCLUDE_ALL_METADATA. Possible values:  METADATA_UNSPECIFIED INCLUDE_ALL_METADATA EXCLUDE_ALL_METADATA CUSTOM_METADATA | false | None | None |
| `metadata_fields` | Optional. Custom metadata fields to include in the reported VPC flow logs. Can only be specified if \"metadata\" was set to CUSTOM_METADATA. | false | None | None |
| `filter_expr` | Optional. Export filter used to define which VPC Flow Logs should be logged. | false | None | None |
| `interconnect_attachment` | Traffic will be logged from the Interconnect Attachment. Format: projects/{project_id}/regions/{region}/interconnectAttachments/{name} | false | None | None |
| `vpn_tunnel` | Traffic will be logged from the VPN Tunnel. Format: projects/{project_id}/regions/{region}/vpnTunnels/{name} | false | None | None |
| `labels` | Optional. Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
