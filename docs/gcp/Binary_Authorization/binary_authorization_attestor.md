## 🛡️ Policy Deployment Engine: `binary_authorization_attestor`

This section provides a concise policy evaluation for the `binary_authorization_attestor` resource in GCP.

Reference: [Terraform Registry – binary_authorization_attestor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/binary_authorization_attestor)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name. | true | None | None |
| `description` | A descriptive comment. This field may be updated. The field may be displayed in chooser dialogs. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### attestation_authority_note Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `note_reference` | The resource name of a ATTESTATION_AUTHORITY Note, created by the user. If the Note is in a different project from the Attestor, it should be specified in the format `projects/*/notes/*` (or the legacy `providers/*/notes/*`). This field may not be updated. An attestation by this attestor is stored as a Container Analysis ATTESTATION_AUTHORITY Occurrence that names a container image and that links to this Note. | true | None | None |
| `public_keys` | Public keys that verify attestations signed by this attestor. This field may be updated. If this field is non-empty, one of the specified public keys must verify that an attestation was signed by this attestor for the image specified in the admission request. If this field is empty, this attestor always returns that no valid attestations exist. Structure is [documented below](#nested_attestation_authority_note_public_keys). | false | None | None |
| `delegation_service_account_email` | (Output) This field will contain the service account email address that this Attestor will use as the principal when querying Container Analysis. Attestor administrators must grant this service account the IAM role needed to read attestations from the noteReference in Container Analysis (containeranalysis.notes.occurrences.viewer). This email address is fixed for the lifetime of the Attestor, but callers should not make any other assumptions about the service account email; future versions may use an email based on a different naming pattern. | none | None | None |

### public_keys Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `comment` | A descriptive comment. This field may be updated. | false | None | None |
| `id` | The ID of this public key. Signatures verified by BinAuthz must include the ID of the public key that can be used to verify them, and that ID must match the contents of this field exactly. Additional restrictions on this field can be imposed based on which public key type is encapsulated. See the documentation on publicKey cases below for details. | false | None | None |
| `ascii_armored_pgp_public_key` | ASCII-armored representation of a PGP public key, as the entire output by the command `gpg --export --armor foo@example.com` (either LF or CRLF line endings). When using this field, id should be left blank. The BinAuthz API handlers will calculate the ID and fill it in automatically. BinAuthz computes this ID as the OpenPGP RFC4880 V4 fingerprint, represented as upper-case hex. If id is provided by the caller, it will be overwritten by the API-calculated ID. | false | None | None |
| `pkix_public_key` | A raw PKIX SubjectPublicKeyInfo format public key. NOTE: id may be explicitly provided by the caller when using this type of public key, but it MUST be a valid RFC3986 URI. If id is left blank, a default one will be computed based on the digest of the DER encoding of the public key. Structure is [documented below](#nested_attestation_authority_note_public_keys_public_keys_pkix_public_key). | false | None | None |

### pkix_public_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `public_key_pem` | A PEM-encoded public key, as described in `https://tools.ietf.org/html/rfc7468#section-13` | false | None | None |
| `signature_algorithm` | The signature algorithm used to verify a message against a signature using this key. These signature algorithm must match the structure and any object identifiers encoded in publicKeyPem (i.e. this algorithm must match that of the public key). | false | None | None |
