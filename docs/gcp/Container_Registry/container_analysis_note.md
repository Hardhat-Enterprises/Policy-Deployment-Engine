## 🛡️ Policy Deployment Engine: `container_analysis_note`

This section provides a concise policy evaluation for the `container_analysis_note` resource in GCP.

Reference: [Terraform Registry – container_analysis_note](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_analysis_note)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the note. | true | None | None |
| `short_description` | A one sentence description of the note. | false | None | None |
| `long_description` | A detailed description of the note | false | None | None |
| `expiration_time` | Time of expiration for this note. Leave empty if note does not expire. | false | None | None |
| `related_note_names` | Names of other notes related to this note. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### attestation_authority Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hint` | This submessage provides human-readable hints about the purpose of the AttestationAuthority. Because the name of a Note acts as its resource reference, it is important to disambiguate the canonical name of the Note (which might be a UUID for security purposes) from "readable" names more suitable for debug output. Note that these hints should NOT be used to look up AttestationAuthorities in security sensitive contexts, such as when looking up Attestations to verify. Structure is [documented below](#nested_attestation_authority_hint). | true | None | None |

### related_url Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `url` | Specific URL associated with the resource. | true | None | None |
| `label` | Label to describe usage of the URL | false | None | None |

### hint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `human_readable_name` | The human readable name of this Attestation Authority, for example "qa". | true | None | None |
