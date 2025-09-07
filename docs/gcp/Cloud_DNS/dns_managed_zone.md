## 🛡️ Policy Deployment Engine: `dns_managed_zone`

This section provides a concise policy evaluation for the `dns_managed_zone` resource in GCP.

Reference: [Terraform Registry – dns_managed_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone)

---

## 1. Argument Reference

### `dns_name`
- Description: (Required) The DNS name of this managed zone, for instance "example.com.".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) User assigned name for this resource. Must be unique within the project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A textual description field. Defaults to 'Managed by Terraform'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dnssec_config`
- Description: (Optional) DNSSEC configuration Structure is [documented below](#nested_dnssec_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A set of key/value label pairs to assign to this ManagedZone. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `visibility`
- Description: (Optional) The zone's visibility: public zones are exposed to the Internet, while private zones are visible only to Virtual Private Cloud resources. Default value is `public`. Possible values are: `private`, `public`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_visibility_config`
- Description: (Optional) For privately visible zones, the set of Virtual Private Cloud resources that the zone is visible from. At least one of `gke_clusters` or `networks` must be specified. Structure is [documented below](#nested_private_visibility_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `forwarding_config`
- Description: (Optional) The presence for this field indicates that outbound forwarding is enabled for this zone. The value of this field contains the set of destinations to forward to. Structure is [documented below](#nested_forwarding_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peering_config`
- Description: (Optional) The presence of this field indicates that DNS Peering is enabled for this zone. The value of this field contains the network to peer with. Structure is [documented below](#nested_peering_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reverse_lookup`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Specifies if this is a managed reverse lookup zone. If true, Cloud DNS will resolve reverse lookup queries using automatically configured records for VPC resources. This only applies to networks listed under `private_visibility_config`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_directory_config`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The presence of this field indicates that this zone is backed by Service Directory. The value of this field contains information related to the namespace associated with the zone. Structure is [documented below](#nested_service_directory_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_logging_config`
- Description: (Optional) Cloud logging configuration Structure is [documented below](#nested_cloud_logging_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_destroy`
- Description: <a name="nested_dnssec_config"></a>The `dnssec_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kind`
- Description: (Optional) Identifies what kind of resource this is
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `non_existence`
- Description: (Optional) Specifies the mechanism used to provide authenticated denial-of-existence responses. non_existence can only be updated when the state is `off`. Possible values are: `nsec`, `nsec3`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Optional) Specifies whether DNSSEC is enabled, and what mode it is in Possible values are: `off`, `on`, `transfer`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_key_specs`
- Description: (Optional) Specifies parameters that will be used for generating initial DnsKeys for this ManagedZone. If you provide a spec for keySigning or zoneSigning, you must also provide one for the other. default_key_specs can only be updated when the state is `off`. Structure is [documented below](#nested_dnssec_config_default_key_specs). <a name="nested_dnssec_config_default_key_specs"></a>The `default_key_specs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `algorithm`
- Description: (Optional) String mnemonic specifying the DNSSEC algorithm of this key Possible values are: `ecdsap256sha256`, `ecdsap384sha384`, `rsasha1`, `rsasha256`, `rsasha512`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_length`
- Description: (Optional) Length of the keys in bits
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_type`
- Description: (Optional) Specifies whether this is a key signing key (KSK) or a zone signing key (ZSK). Key signing keys have the Secure Entry Point flag set and, when active, will only be used to sign resource record sets of type DNSKEY. Zone signing keys do not have the Secure Entry Point flag set and will be used to sign all other types of resource record sets. Possible values are: `keySigning`, `zoneSigning`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kind`
- Description: (Optional) Identifies what kind of resource this is <a name="nested_private_visibility_config"></a>The `private_visibility_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke_clusters`
- Description: (Optional) The list of Google Kubernetes Engine clusters that can see this zone. Structure is [documented below](#nested_private_visibility_config_gke_clusters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `networks`
- Description: (Optional) The list of VPC networks that can see this zone. Until the provider updates to use the Terraform 0.12 SDK in a future release, you may experience issues with this resource while updating. If you've defined a `networks` block and add another `networks` block while keeping the old block, Terraform will see an incorrect diff and apply an incorrect update to the resource. If you encounter this issue, remove all `networks` blocks in an update and then apply another update adding all of them back simultaneously. Structure is [documented below](#nested_private_visibility_config_networks). <a name="nested_private_visibility_config_gke_clusters"></a>The `gke_clusters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke_cluster_name`
- Description: (Required) The resource name of the cluster to bind this ManagedZone to. This should be specified in the format like `projects/*/locations/*/clusters/*` <a name="nested_private_visibility_config_networks"></a>The `networks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_url`
- Description: (Required) The id or fully qualified URL of the VPC network to bind to. This should be formatted like `projects/{project}/global/networks/{network}` or `https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}` <a name="nested_forwarding_config"></a>The `forwarding_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_name_servers`
- Description: (Required) List of target name servers to forward to. Cloud DNS will select the best available name server if more than one target is given. Structure is [documented below](#nested_forwarding_config_target_name_servers). <a name="nested_forwarding_config_target_name_servers"></a>The `target_name_servers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ipv4_address`
- Description: (Optional) IPv4 address of a target name server.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain_name`
- Description: (Optional) Fully qualified domain name for the forwarding target.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `forwarding_path`
- Description: (Optional) Forwarding path for this TargetNameServer. If unset or `default` Cloud DNS will make forwarding decision based on address ranges, i.e. RFC1918 addresses go to the VPC, Non-RFC1918 addresses go to the Internet. When set to `private`, Cloud DNS will always send queries through VPC for this target Possible values are: `default`, `private`. <a name="nested_peering_config"></a>The `peering_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_network`
- Description: (Required) The network with which to peer. Structure is [documented below](#nested_peering_config_target_network). <a name="nested_peering_config_target_network"></a>The `target_network` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_url`
- Description: (Required) The id or fully qualified URL of the VPC network to forward queries to. This should be formatted like `projects/{project}/global/networks/{network}` or `https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}` <a name="nested_service_directory_config"></a>The `service_directory_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace`
- Description: (Required) The namespace associated with the zone. Structure is [documented below](#nested_service_directory_config_namespace). <a name="nested_service_directory_config_namespace"></a>The `namespace` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace_url`
- Description: (Required) The fully qualified or partial URL of the service directory namespace that should be associated with the zone. This should be formatted like `https://servicedirectory.googleapis.com/v1/projects/{project}/locations/{location}/namespaces/{namespace_id}` or simply `projects/{project}/locations/{location}/namespaces/{namespace_id}` Ignored for `public` visibility zones. <a name="nested_cloud_logging_config"></a>The `cloud_logging_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_logging`
- Description: (Required) If set, enable query logging for this ManagedZone. False by default, making logging opt-in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
