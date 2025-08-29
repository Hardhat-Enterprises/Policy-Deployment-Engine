# SIT782-TeamProject-B Procedure

# Step 1:

1. Complete Upskilling Guide to Demo instructions
2. Ensure dependencies such as Visual Studio Code and Git is already installed on the system.

# Step 2:

1. Install OPA (Open Policy Agent on Windows)
2. Create a Google Cloud Account and Install Google Cloud SDK Shell
3.  Install Terraform on Windows
4. Add all the above installations into the Windows ENV System path
5. Install Visual Studio Code extensions i.e., (Hashicorp Terraform by hashicorp, Open Policy Agent by Torin Sandall) 

# Step 3:

1. Clone the Repository on the local system:

```bash
1. git clone https://github.com/Hardhat-Enterprises/Policy-Deployment-Engine.git
2. git branch gcp/service/<service_name>
3. git checkout gcp/service/<service_name>
```

2. Clear-up the Directories to match with the following structure

```markdown
Policy-Development-Engine/
├── input/
│   ├── aws/
│   ├── azure/
|		└── gcp/
|       └── <service_x>
|						├── <resource_1>
|						├── <resource_2>
|						└── <resource_x>
|						    ├── <attribute-chosen-to-work-on>
|						        ├── c.tf , config.tf, nc.tf
├── policy/
│   ├── aws/
│   ├── azure/
│   └── gcp/
|       └── helpers
|       └── <service>
|						├── <resource_1>
|						├── <resource_2>
|						└── <resource_x>
|						    ├── <attribute-chosen-to-work-on>
|						        ├── policy.rego
├── templates/
│   └── gcp/
│       ├── c.tf
|       ├── config.tf
│       ├── nc.tf
|       ├── policy.rego
|       └── vars.rego
│── .gitignore
└── README.md
```

# Step 4:

1. Initializing the terraform init by using the [config.tf](http://config.tf) that is shown down below and declare it in ./Input/gcp/<service>/<resource>/<attribute>/config.tf

```
config.tf 

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {}
```

2. We need to declare the vars.rego file in the directory ./Policy/gcp/<service>/vars.rego after initializing the 

```
vars.rego 

package terraform.gcp.security.<SERVICE>.<RESOURCE>.vars 

variables := { 
    "friendly_resource_name": "<easy-to-read name of your resource>",  # In my case "Policy Orchestrator"
    "resource_type":  "<RESOURCE>", # In my case "google_os_config_v2_policy_orchestrator"
    "resource_value_name" : "<how your resource is identified in the “values” block>"  # In my case "policy_orchestrator_id"
} 
```

3. After initializing the vars.rego, we are to build two inputs, compliant resource called “c.tf” and the non compliant resource called “nc.tf”

```
c.tf #Similarly, build a nc.tf where we showcase the non-compliant version. For example, Apple is accepted hence compliant, Android isn't hence non-compliant.

#Build the code that you want to test for the compliant
#For example in my service OS_CONFIG_V2

#In the first inverted column in the resource below, we will be using the resource type 
#that is declared in the vars file. In the next inverted column, we declare the type of 
#this is, in this case compliant "c.tf".

# resource "resource_type" "c"{ the build of the code} NOTE: resource_type as declared in the vars.rego
resource "google_os_config_v2_policy_orchestrator" "c" { 
    
    
   policy_orchestrator_id = "po" #This is the attribute that is used to identify the resource that I am working on in the vars.rego
    project = "121623553414"
    state = "ACTIVE"
    action = "UPSERT"

#This is the attribute we are working on, note that this is a nested attribute meaning,
#It has multiple required attributes under the main attribute. 
#Therefore, we generally, cannot build a direct policy in such cases.

    orchestrated_resource {
        id = "test-orchestrated-resource"
        os_policy_assignment_v1_payload {
            os_policies {
                id = "test-os-policy"
                mode = "VALIDATION"
                resource_groups {
                    resources {
                        id = "resource-tf"
                    }
                }
            }
            instance_filter {
                inventories {
                    os_short_name = ["Debian"] #In my first policy, this is the value that I am trying to check for with the help of the policy
                }
            }
            rollout {
                disruption_budget {
                    percent = 100
                }
                min_wait_duration = "60s"
            }
        }
    }
    labels = {
        state = "active"
    }
}
```

4. Initialize the plan building after all the compliance and non-compliance are properly built for the policy by performing the following commands, we do this since REGO has the ability to read and interpret JSON files and we can evaluate the policies that we have written in rego using this JSON file:

```bash
1. $terraform init 
2. $terraform plan --out=plan
3. $terraform show -json plan > plan.json
```

5. Based on the compliant and non-compliant files you just built for the desired attribute, you will now write a policy.rego with the help of the following template.

```
package terraform.gcp.security.<service>.<resource_type>.<policy_name> # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.<service>.<resource_type>.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "A self documenting message about the conditions within",
    "remedies":[ "Something that fixes the issues in this situation","You can have multiple items in the array"]},
    {
        "condition": "A message about what the condition does",
        "attribute_path" : [], # Path to the attribute could like eg. ["orchestrated_resource",0,"os_short_name"]
        "values" : [], # Values to compare against for example, we are comparing the os_short_name's value as debian, then **"value": ["Debian"]**
        "policy_type" : "" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist' these are all defined in the helpers.rego 
    }
    ]
]

# STEP 3: CONNECT THE HELPER FUNCTIONS INTO THE POLICY

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
```

6. Run the following commands to verify, if the policy is working as intended:

```bash
1. opa eval --data .\policies\gcp --input .\inputs\gcp\<service>\<resource>\<attribute>\plan.json "data.terraform.gcp.security.<service>.<resource>.<attribute>.message" --format pretty
2. opa eval --data .\policies\gcp --input .\inputs\gcp\<service>\<resource>\<attribute>\plan.json "data.terraform.gcp.security.<service>.<resource>.<attribute>.details" --format pretty
3. opa eval --data .\policies\gcp --input .\inputs\gcp\<service>\<resource>\<attribute>\plan.json "data.terraform.gcp.security.<service>.<resource>.<attribute>.message" --format pretty --explain=fails
```

# Step 5:

1. Once the evaluation is successful for the policy that you are trying to create. Perform the following the commands to push the code to GitHub branch that you have created
    
    ```bash
    1. git branch #to verify which branch are you working in at currently
    2. git status #to see what changes you have made
    3. git add * #To stage the changes you have made
    4. git commit -m "Your commit message" -m "Description to what you are trying to commit for"
    5. git push origin gcp/service/<service_name>
    ```