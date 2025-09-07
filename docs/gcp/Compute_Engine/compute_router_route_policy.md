## 🛡️ Policy Deployment Engine: `compute_router_route_policy`

This section provides a concise policy evaluation for the `compute_router_route_policy` resource in GCP.

Reference: [Terraform Registry – compute_router_route_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_route_policy)

---

## 1. Argument Reference

### `terms`
- Description: (Required) List of terms (the order in the list is not important, they are evaluated in order of priority). Structure is [documented below](#nested_terms).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `router`
- Description: (Required) The name of the Cloud Router in which this route policy will be configured.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the route policy. This policy's name, which must be a resource ID segment and unique within all policies owned by the Router
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) This is policy's type, which is one of IMPORT or EXPORT Possible values are: `ROUTE_POLICY_TYPE_IMPORT`, `ROUTE_POLICY_TYPE_EXPORT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Region where the router and NAT reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_terms"></a>The `terms` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: (Required) The evaluation priority for this term, which must be between 0 (inclusive) and 231 (exclusive), and unique within the list.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match`
- Description: (Required) CEL expression evaluated against a route to determine if this term applies (see Policy Language). Structure is [documented below](#nested_terms_terms_match).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `actions`
- Description: (Optional) 'CEL expressions to evaluate to modify a route when this term matches.'\ Structure is [documented below](#nested_terms_terms_actions). <a name="nested_terms_terms_match"></a>The `match` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Required) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Title for the expression, i.e. a short string describing its purpose.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the expression
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) String indicating the location of the expression for error reporting, e.g. a file name and a position in the file <a name="nested_terms_terms_actions"></a>The `actions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Required) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Title for the expression, i.e. a short string describing its purpose.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the expression
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) String indicating the location of the expression for error reporting, e.g. a file name and a position in the file
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
