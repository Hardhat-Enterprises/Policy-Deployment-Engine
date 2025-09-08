## 🛡️ Policy Deployment Engine: `dns_managed_zone`

This section provides a concise policy evaluation for the `dns_managed_zone` resource in GCP.

Reference: [Terraform Registry – dns_managed_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dns_name` | The DNS name of this managed zone, for instance "example.com.". | true | None | None |
| `name` | User assigned name for this resource. Must be unique within the project. | true | None | None |
| `description` | A textual description field. Defaults to 'Managed by Terraform'. | false | None | None |
| `labels` | A set of key/value label pairs to assign to this ManagedZone. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `visibility` | The zone's visibility: public zones are exposed to the Internet, while private zones are visible only to Virtual Private Cloud resources. Default value is `public`. Possible values are: `private`, `public`. | false | None | None |
| `reverse_lookup` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Specifies if this is a managed reverse lookup zone. If true, Cloud DNS will resolve reverse lookup queries using automatically configured records for VPC resources. This only applies to networks listed under `private_visibility_config`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `force_destroy` |  | none | None | None |

### dnssec_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kind` | Identifies what kind of resource this is | false | None | None |
| `non_existence` | Specifies the mechanism used to provide authenticated denial-of-existence responses. non_existence can only be updated when the state is `off`. Possible values are: `nsec`, `nsec3`. | false | None | None |
| `state` | Specifies whether DNSSEC is enabled, and what mode it is in Possible values are: `off`, `on`, `transfer`. | false | None | None |
| `default_key_specs` | Specifies parameters that will be used for generating initial DnsKeys for this ManagedZone. If you provide a spec for keySigning or zoneSigning, you must also provide one for the other. default_key_specs can only be updated when the state is `off`. Structure is [documented below](#nested_dnssec_config_default_key_specs). | false | None | None |

### private_visibility_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `gke_clusters` | The list of Google Kubernetes Engine clusters that can see this zone. Structure is [documented below](#nested_private_visibility_config_gke_clusters). | false | None | None |
| `networks` | The list of VPC networks that can see this zone. Until the provider updates to use the Terraform 0.12 SDK in a future release, you may experience issues with this resource while updating. If you've defined a `networks` block and add another `networks` block while keeping the old block, Terraform will see an incorrect diff and apply an incorrect update to the resource. If you encounter this issue, remove all `networks` blocks in an update and then apply another update adding all of them back simultaneously. Structure is [documented below](#nested_private_visibility_config_networks). | false | None | None |

### forwarding_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_name_servers` | List of target name servers to forward to. Cloud DNS will select the best available name server if more than one target is given. Structure is [documented below](#nested_forwarding_config_target_name_servers). | true | None | None |

### peering_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_network` | The network with which to peer. Structure is [documented below](#nested_peering_config_target_network). | true | None | None |

### service_directory_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `namespace` | The namespace associated with the zone. Structure is [documented below](#nested_service_directory_config_namespace). | true | None | None |

### cloud_logging_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_logging` | If set, enable query logging for this ManagedZone. False by default, making logging opt-in. | true | None | None |

### default_key_specs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `algorithm` | String mnemonic specifying the DNSSEC algorithm of this key Possible values are: `ecdsap256sha256`, `ecdsap384sha384`, `rsasha1`, `rsasha256`, `rsasha512`. | false | None | None |
| `key_length` | Length of the keys in bits | false | None | None |
| `key_type` | Specifies whether this is a key signing key (KSK) or a zone signing key (ZSK). Key signing keys have the Secure Entry Point flag set and, when active, will only be used to sign resource record sets of type DNSKEY. Zone signing keys do not have the Secure Entry Point flag set and will be used to sign all other types of resource record sets. Possible values are: `keySigning`, `zoneSigning`. | false | None | None |
| `kind` | Identifies what kind of resource this is | false | None | None |

### gke_clusters Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `gke_cluster_name` | The resource name of the cluster to bind this ManagedZone to. This should be specified in the format like `projects/*/locations/*/clusters/*` | true | None | None |

### networks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network_url` | The id or fully qualified URL of the VPC network to bind to. This should be formatted like `projects/{project}/global/networks/{network}` or `https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}` | true | None | None |

### target_name_servers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ipv4_address` | IPv4 address of a target name server. | false | None | None |
| `domain_name` | Fully qualified domain name for the forwarding target. | false | None | None |
| `forwarding_path` | Forwarding path for this TargetNameServer. If unset or `default` Cloud DNS will make forwarding decision based on address ranges, i.e. RFC1918 addresses go to the VPC, Non-RFC1918 addresses go to the Internet. When set to `private`, Cloud DNS will always send queries through VPC for this target Possible values are: `default`, `private`. | false | None | None |

### target_network Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network_url` | The id or fully qualified URL of the VPC network to forward queries to. This should be formatted like `projects/{project}/global/networks/{network}` or `https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}` | true | None | None |

### namespace Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `namespace_url` | The fully qualified or partial URL of the service directory namespace that should be associated with the zone. This should be formatted like `https://servicedirectory.googleapis.com/v1/projects/{project}/locations/{location}/namespaces/{namespace_id}` or simply `projects/{project}/locations/{location}/namespaces/{namespace_id}` Ignored for `public` visibility zones. | true | None | None |
