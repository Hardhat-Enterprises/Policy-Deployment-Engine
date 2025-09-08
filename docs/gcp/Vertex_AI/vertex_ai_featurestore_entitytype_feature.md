## 🛡️ Policy Deployment Engine: `vertex_ai_featurestore_entitytype_feature`

This section provides a concise policy evaluation for the `vertex_ai_featurestore_entitytype_feature` resource in GCP.

Reference: [Terraform Registry – vertex_ai_featurestore_entitytype_feature](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_featurestore_entitytype_feature)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `value_type` | Type of Feature value. Immutable. https://cloud.google.com/vertex-ai/docs/reference/rest/v1/projects.locations.featurestores.entityTypes.features#ValueType | true | None | None |
| `entitytype` | The name of the Featurestore to use, in the format projects/{project}/locations/{location}/featurestores/{featurestore}/entityTypes/{entitytype}. | true | None | None |
| `name` | The name of the feature. The feature can be up to 64 characters long and can consist only of ASCII Latin letters A-Z and a-z, underscore(_), and ASCII digits 0-9 starting with a letter. The value will be unique given an entity type. | false | None | None |
| `labels` | A set of key/value label pairs to assign to the feature. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | Description of the feature. | false | None | None |
