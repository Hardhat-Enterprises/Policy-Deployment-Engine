## 🛡️ Policy Deployment Engine: `container_analysis_occurrence`

This section provides a concise policy evaluation for the `container_analysis_occurrence` resource in GCP.

Reference: [Terraform Registry – container_analysis_occurrence](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_analysis_occurrence)

---

## 1. Argument Reference

### `resource_uri`
- Description: (Required) Required. Immutable. A URI that represents the resource for which the occurrence applies. For example, https://gcr.io/project/image@sha256:123abc for a Docker image.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `note_name`
- Description: (Required) The analysis note associated with this occurrence, in the form of projects/[PROJECT]/notes/[NOTE_ID]. This field can be used as a filter in list requests.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attestation`
- Description: (Required) Occurrence that represents a single "attestation". The authenticity of an attestation can be verified using the attached signature. If the verifier trusts the public key of the signer, then verifying the signature is sufficient to establish trust. In this circumstance, the authority to which this attestation is attached is primarily useful for lookup (how to find this attestation if you already know the authority and artifact to be verified) and intent (for which authority this attestation was intended to sign. Structure is [documented below](#nested_attestation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remediation`
- Description: (Optional) A description of actions that can be taken to remedy the note.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_attestation"></a>The `attestation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `serialized_payload`
- Description: (Required) The serialized payload that is verified by one or more signatures. A base64-encoded string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `signatures`
- Description: (Required) One or more signatures over serializedPayload. Verifier implementations should consider this attestation message verified if at least one signature verifies serializedPayload. See Signature in common.proto for more details on signature structure and verification. Structure is [documented below](#nested_attestation_signatures). <a name="nested_attestation_signatures"></a>The `signatures` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `signature`
- Description: (Optional) The content of the signature, an opaque bytestring. The payload that this signature verifies MUST be unambiguously provided with the Signature during verification. A wrapper message might provide the payload explicitly. Alternatively, a message might have a canonical serialization that can always be unambiguously computed to derive the payload.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_key_id`
- Description: (Required) The identifier for the public key that verifies this signature. MUST be an RFC3986 conformant URI. * When possible, the key id should be an immutable reference, such as a cryptographic digest. Examples of valid values: * OpenPGP V4 public key fingerprint. See https://www.iana.org/assignments/uri-schemes/prov/openpgp4fpr for more details on this scheme.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
