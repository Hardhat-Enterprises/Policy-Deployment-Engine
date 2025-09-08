## 🛡️ Policy Deployment Engine: `network_connectivity_regional_endpoint`

This section provides a concise policy evaluation for the `network_connectivity_regional_endpoint` resource in GCP.

Reference: [Terraform Registry – network_connectivity_regional_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_regional_endpoint)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_google_api` | The service endpoint this private regional endpoint connects to. Format: `{apiname}.{region}.rep.googleapis.com` Example: \"cloudkms.us-central1.rep.googleapis.com\". | true | None | None |
| `access_type` | The access type of this regional endpoint. This field is reflected in the PSC Forwarding Rule configuration to enable global access. Possible values are: `GLOBAL`, `REGIONAL`. | true | None | None |
| `name` | The name of the RegionalEndpoint. | true | None | None |
| `location` | The location of the RegionalEndpoint. | true | None | None |
| `labels` | User-defined labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A description of this resource. | false | None | None |
| `network` | The name of the VPC network for this private regional endpoint. Format: `projects/{project}/global/networks/{network}` | false | None | None |
| `subnetwork` | The name of the subnetwork from which the IP address will be allocated. Format: `projects/{project}/regions/{region}/subnetworks/{subnetwork}` | false | None | None |
| `address` | The IP Address of the Regional Endpoint. When no address is provided, an IP from the subnetwork is allocated. Use one of the following formats: * IPv4 address as in `10.0.0.1` * Address resource URI as in `projects/{project}/regions/{region}/addresses/{address_name}` ~> **Note:** This field accepts both a reference to a Compute Address resource, which is the resource name of which format is given in the description, and IP literal value. If the user chooses to input a reserved address value; they need to make sure that the reserved address is in IPv4 version, its purpose is GCE_ENDPOINT, its type is INTERNAL and its status is RESERVED. If the user chooses to input an IP literal, they need to make sure that it's a valid IPv4 address (x.x.x.x) within the subnetwork. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
