## 🛡️ Policy Deployment Engine: `compute_target_instance`

This section provides a concise policy evaluation for the `compute_target_instance` resource in GCP.

Reference: [Terraform Registry – compute_target_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `instance` | The Compute instance VM handling traffic for this target instance. Accepts the instance self-link, relative path (e.g. `projects/project/zones/zone/instances/instance`) or name. If name is given, the zone will default to the given zone or the provider-default zone and the project will default to the provider-level project. | true | None | None |
| `network` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The URL of the network this target instance uses to forward traffic. If not specified, the traffic will be forwarded to the network that the default network interface belongs to. | false | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `nat_policy` | NAT option controlling how IPs are NAT'ed to the instance. Currently only NO_NAT (default value) is supported. Default value is `NO_NAT`. Possible values are: `NO_NAT`. | false | None | None |
| `security_policy` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The resource URL for the security policy associated with this target instance. | false | None | None |
| `zone` | URL of the zone where the target instance resides. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
