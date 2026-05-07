## 🛡️ Policy Deployment Engine: `google_biglake_catalog`

This section provides a concise policy evaluation for the `google_biglake_catalog` resource in GCP.

Reference: [Terraform Registry – google_biglake_catalog](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_biglake_catalog)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the BigLake catalog. | true | false | None | None | None |
| `project` | The project in which the BigLake catalog is created. | false | true | Explicitly specifying the project ensures that the catalog is created within the intended security boundary and governance scope. | my-secure-project | None |
| `location` | The location of the BigLake catalog. | true | true | The catalog location determines where metadata is stored and affects data residency, compliance, and regulatory requirements. | ['au'] | ['eu'] |
