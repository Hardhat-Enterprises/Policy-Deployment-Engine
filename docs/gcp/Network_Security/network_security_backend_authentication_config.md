## 🛡️ Policy Deployment Engine: `network_security_backend_authentication_config`

This section provides a concise policy evaluation for the `network_security_backend_authentication_config` resource in GCP.

Reference: [Terraform Registry – network_security_backend_authentication_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_backend_authentication_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the BackendAuthenticationConfig resource. | true | None | None |
| `labels` | Set of label tags associated with the BackendAuthenticationConfig resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `client_certificate` | Reference to a Certificate resource from the certificatemanager.googleapis.com namespace. Used by a BackendService to negotiate mTLS when the backend connection uses TLS and the backend requests a client certificate. Must have a CLIENT_AUTH scope. | false | None | None |
| `trust_config` | Reference to a TrustConfig resource from the certificatemanager.googleapis.com namespace. A BackendService uses the chain of trust represented by this TrustConfig, if specified, to validate the server certificates presented by the backend. Required unless wellKnownRoots is set to PUBLIC_ROOTS. | false | None | None |
| `well_known_roots` | Well known roots to use for server certificate validation. If set to NONE, the BackendService will only validate server certificates against roots specified in TrustConfig. If set to PUBLIC_ROOTS, the BackendService uses a set of well-known public roots, in addition to any roots specified in the trustConfig field, when validating the server certificates presented by the backend. Validation with these roots is only considered when the TlsSettings.sni field in the BackendService is set. The well-known roots are a set of root CAs managed by Google. CAs in this set can be added or removed without notice. Possible values are: `NONE`, `PUBLIC_ROOTS`. | false | None | None |
| `location` | The location of the backend authentication config. The default value is `global`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
