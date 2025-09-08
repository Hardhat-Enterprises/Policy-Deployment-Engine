## 🛡️ Policy Deployment Engine: `compute_global_address`

This section provides a concise policy evaluation for the `compute_global_address` resource in GCP.

Reference: [Terraform Registry – compute_global_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035.  Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `address` | The IP address or beginning of the address range represented by this resource. This can be supplied as an input to reserve a specific address or omitted to allow GCP to choose a valid one for you. | false | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `labels` | Labels to apply to this address.  A list of key->value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `ip_version` | The IP Version that will be used by this address. The default value is `IPV4`. Possible values are: `IPV4`, `IPV6`. | false | None | None |
| `prefix_length` | The prefix length of the IP range. If not present, it means the address field is a single IP address. This field is not applicable to addresses with addressType=INTERNAL when purpose=PRIVATE_SERVICE_CONNECT | false | None | None |
| `address_type` | The type of the address to reserve. * EXTERNAL indicates public/external single IP address. * INTERNAL indicates internal IP ranges belonging to some network. Default value is `EXTERNAL`. Possible values are: `EXTERNAL`, `INTERNAL`. | false | None | None |
| `purpose` | The purpose of the resource. Possible values include: * VPC_PEERING - for peer networks * PRIVATE_SERVICE_CONNECT - for ([Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html) only) Private Service Connect networks | false | None | None |
| `network` | The URL of the network in which to reserve the IP range. The IP range must be in RFC1918 space. The network cannot be deleted if there are any reserved IP ranges referring to it. This should only be set when using an Internal address. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
