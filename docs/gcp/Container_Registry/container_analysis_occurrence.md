## 🛡️ Policy Deployment Engine: `container_analysis_occurrence`

This section provides a concise policy evaluation for the `container_analysis_occurrence` resource in GCP.

Reference: [Terraform Registry – container_analysis_occurrence](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_analysis_occurrence)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_uri` | Required. Immutable. A URI that represents the resource for which the occurrence applies. For example, https://gcr.io/project/image@sha256:123abc for a Docker image. | true | None | None |
| `note_name` | The analysis note associated with this occurrence, in the form of projects/[PROJECT]/notes/[NOTE_ID]. This field can be used as a filter in list requests. | true | None | None |
| `remediation` | A description of actions that can be taken to remedy the note. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### attestation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `serialized_payload` | The serialized payload that is verified by one or more signatures. A base64-encoded string. | true | None | None |
| `signatures` | One or more signatures over serializedPayload. Verifier implementations should consider this attestation message verified if at least one signature verifies serializedPayload. See Signature in common.proto for more details on signature structure and verification. Structure is [documented below](#nested_attestation_signatures). | true | None | None |

### signatures Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `signature` | The content of the signature, an opaque bytestring. The payload that this signature verifies MUST be unambiguously provided with the Signature during verification. A wrapper message might provide the payload explicitly. Alternatively, a message might have a canonical serialization that can always be unambiguously computed to derive the payload. | false | None | None |
| `public_key_id` | The identifier for the public key that verifies this signature. MUST be an RFC3986 conformant URI. * When possible, the key id should be an immutable reference, such as a cryptographic digest. Examples of valid values: * OpenPGP V4 public key fingerprint. See https://www.iana.org/assignments/uri-schemes/prov/openpgp4fpr for more details on this scheme. * `openpgp4fpr:74FAF3B861BDA0870C7B6DEF607E48D2A663AEEA` * RFC6920 digest-named SubjectPublicKeyInfo (digest of the DER serialization): * "ni:///sha-256;cD9o9Cq6LG3jD0iKXqEi_vdjJGecm_iXkbqVoScViaU" | true | None | None |
