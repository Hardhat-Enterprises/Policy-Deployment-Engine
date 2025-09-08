## 🛡️ Policy Deployment Engine: `compute_network_attachment`

This section provides a concise policy evaluation for the `compute_network_attachment` resource in GCP.

Reference: [Terraform Registry – compute_network_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_attachment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `connection_preference` | The connection preference of service attachment. The value can be set to ACCEPT_AUTOMATIC. An ACCEPT_AUTOMATIC service attachment is one that always accepts the connection from consumer forwarding rules. Possible values are: `ACCEPT_AUTOMATIC`, `ACCEPT_MANUAL`, `INVALID`. | true | None | None |
| `subnetworks` | An array of URLs where each entry is the URL of a subnet provided by the service consumer to use for endpoints in the producers that connect to this network attachment. | true | None | None |
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `region` | URL of the region where the network attachment resides. This field applies only to the region resource. You must specify this field as part of the HTTP request URL. It is not settable as a field in the request body. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `producer_reject_lists` | Projects that are not allowed to connect to this network attachment. The project can be specified using its id or number. | false | None | None |
| `producer_accept_lists` | Projects that are allowed to connect to this network attachment. The project can be specified using its id or number. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
