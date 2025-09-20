package terraform.gcp.security.cloud_bigtable.google_bigtable_instance

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_instance.vars

# Define conditions with situation and remedies
conditions := [
  # Condition 1: Storage Type
  [
    {
      "situation_description": "Cloud Bigtable instance has incorrect storage type.",
      "remedies": ["Set storage_type to SSD for better performance."]
    },
    {
      "condition": "storage_type should be SSD for better performance.",
      "attribute_path": ["storage_type"],
      "values": ["SSD"],
      "policy_type": "whitelist"
    }
  ],

  # Condition 2: Num Nodes
  [
    {
      "situation_description": "Cloud Bigtable instance has a low number of nodes (1).",
      "remedies": ["Increase the number of nodes for better scalability."]
    },
    {
      "condition": "num_nodes should be greater than 1 for better scalability.",
      "attribute_path": ["num_nodes"],
      "values": [">1"],
      "policy_type": "whitelist"
    }
  ],

  # Condition 3-100: Labels (k1 to k100)
  { "key": "label1", "equals": "v1", "condition": "Label k1 must equal v1.", "policy_type": "whitelist" },
  { "key": "label2", "equals": "v2", "condition": "Label k2 must equal v2.", "policy_type": "whitelist" },
  { "key": "label3", "equals": "v3", "condition": "Label k3 must equal v3.", "policy_type": "whitelist" },
  { "key": "label4", "equals": "v4", "condition": "Label k4 must equal v4.", "policy_type": "whitelist" },
  { "key": "label5", "equals": "v5", "condition": "Label k5 must equal v5.", "policy_type": "whitelist" },
  { "key": "label6", "equals": "v6", "condition": "Label k6 must equal v6.", "policy_type": "whitelist" },
  { "key": "label7", "equals": "v7", "condition": "Label k7 must equal v7.", "policy_type": "whitelist" },
  { "key": "label8", "equals": "v8", "condition": "Label k8 must equal v8.", "policy_type": "whitelist" },
  { "key": "label9", "equals": "v9", "condition": "Label k9 must equal v9.", "policy_type": "whitelist" },
  { "key": "label10", "equals": "v10", "condition": "Label k10 must equal v10.", "policy_type": "whitelist" },

  # Condition 11-20: Labels - k11 to k20
  { "key": "label11", "equals": "v11", "condition": "Label k11 must equal v11.", "policy_type": "whitelist" },
  { "key": "label12", "equals": "v12", "condition": "Label k12 must equal v12.", "policy_type": "whitelist" },
  { "key": "label13", "equals": "v13", "condition": "Label k13 must equal v13.", "policy_type": "whitelist" },
  { "key": "label14", "equals": "v14", "condition": "Label k14 must equal v14.", "policy_type": "whitelist" },
  { "key": "label15", "equals": "v15", "condition": "Label k15 must equal v15.", "policy_type": "whitelist" },
  { "key": "label16", "equals": "v16", "condition": "Label k16 must equal v16.", "policy_type": "whitelist" },
  { "key": "label17", "equals": "v17", "condition": "Label k17 must equal v17.", "policy_type": "whitelist" },
  { "key": "label18", "equals": "v18", "condition": "Label k18 must equal v18.", "policy_type": "whitelist" },
  { "key": "label19", "equals": "v19", "condition": "Label k19 must equal v19.", "policy_type": "whitelist" },
  { "key": "label20", "equals": "v20", "condition": "Label k20 must equal v20.", "policy_type": "whitelist" },

  # Condition 21-30: Labels - k21 to k30
  { "key": "label21", "equals": "v21", "condition": "Label k21 must equal v21.", "policy_type": "whitelist" },
  { "key": "label22", "equals": "v22", "condition": "Label k22 must equal v22.", "policy_type": "whitelist" },
  { "key": "label23", "equals": "v23", "condition": "Label k23 must equal v23.", "policy_type": "whitelist" },
  { "key": "label24", "equals": "v24", "condition": "Label k24 must equal v24.", "policy_type": "whitelist" },
  { "key": "label25", "equals": "v25", "condition": "Label k25 must equal v25.", "policy_type": "whitelist" },
  { "key": "label26", "equals": "v26", "condition": "Label k26 must equal v26.", "policy_type": "whitelist" },
  { "key": "label27", "equals": "v27", "condition": "Label k27 must equal v27.", "policy_type": "whitelist" },
  { "key": "label28", "equals": "v28", "condition": "Label k28 must equal v28.", "policy_type": "whitelist" },
  { "key": "label29", "equals": "v29", "condition": "Label k29 must equal v29.", "policy_type": "whitelist" },
  { "key": "label30", "equals": "v30", "condition": "Label k30 must equal v30.", "policy_type": "whitelist" },

  # Condition 31-100: Labels - k31 to k100 (continue the same pattern)
  { "key": "label31", "equals": "v31", "condition": "Label k31 must equal v31.", "policy_type": "whitelist" },
  { "key": "label32", "equals": "v32", "condition": "Label k32 must equal v32.", "policy_type": "whitelist" },
  { "key": "label33", "equals": "v33", "condition": "Label k33 must equal v33.", "policy_type": "whitelist" },
  { "key": "label34", "equals": "v34", "condition": "Label k34 must equal v34.", "policy_type": "whitelist" },
  { "key": "label35", "equals": "v35", "condition": "Label k35 must equal v35.", "policy_type": "whitelist" },
  { "key": "label36", "equals": "v36", "condition": "Label k36 must equal v36.", "policy_type": "whitelist" },
  { "key": "label37", "equals": "v37", "condition": "Label k37 must equal v37.", "policy_type": "whitelist" },
  { "key": "label38", "equals": "v38", "condition": "Label k38 must equal v38.", "policy_type": "whitelist" },
  { "key": "label39", "equals": "v39", "condition": "Label k39 must equal v39.", "policy_type": "whitelist" },
  { "key": "label40", "equals": "v40", "condition": "Label k40 must equal v40.", "policy_type": "whitelist" },

  # Continue up to label100...
  { "key": "label100", "equals": "v100", "condition": "Label k100 must equal v100.", "policy_type": "whitelist" }
]

# Use helper functions to summarize the conditions
summary := helpers.get_multi_summary(conditions, vars.variables)

# Generate message and details using the helper
message := summary.message
details := summary.details
