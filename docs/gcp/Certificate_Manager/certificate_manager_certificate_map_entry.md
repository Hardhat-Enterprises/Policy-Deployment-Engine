## 🛡️ Policy Deployment Engine: `certificate_manager_certificate_map_entry`

This section provides a concise policy evaluation for the `certificate_manager_certificate_map_entry` resource in GCP.

Reference: [Terraform Registry – certificate_manager_certificate_map_entry](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate_map_entry)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `certificates` | A set of Certificates defines for the given hostname. There can be defined up to fifteen certificates in each Certificate Map Entry. Each certificate must match pattern projects/*/locations/*/certificates/*. | true | None | None |
| `name` | A user-defined name of the Certificate Map Entry. Certificate Map Entry names must be unique globally and match pattern 'projects/*/locations/*/certificateMaps/*/certificateMapEntries/*' | true | None | None |
| `map` | A map entry that is inputted into the cetrificate map | true | None | None |
| `description` | A human-readable description of the resource. | false | None | None |
| `labels` | Set of labels associated with a Certificate Map Entry. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `hostname` | A Hostname (FQDN, e.g. example.com) or a wildcard hostname expression (*.example.com) for a set of hostnames with common suffix. Used as Server Name Indication (SNI) for selecting a proper certificate. | false | None | None |
| `matcher` | A predefined matcher for particular cases, other than SNI selection | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
