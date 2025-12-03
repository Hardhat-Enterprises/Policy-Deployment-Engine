# Workflow
1. research your service and pick the first resource you want to work on
2. Select a resource argument to write a policy against


1. Create folder structure
2. copy template files
3. populate config.tf 
4. populate compliant template - c.tf
copy the example from terraform

5. if there are prerequisite resources included in the tf example check that they are truly required, if so they can be added to config.tf 

4. terraform init

5. check template is error free
terraform plan 
debug if required
6. populate non-compliant template - nc.tf
7. terraform plan --out=plan
8. generate plan json file
terraform show -json plan > plan.json

terraform show -json plan | cat > plan.json



 opa eval --data .\policies\gcp --input .\inputs\gcp\<SERVICE>\<RESOURCE>\<ATTRIBUTE>\plan.json "data.terraform.gcp.security.<SERVICE>.<RESOURCE>.<ATTRIBUTE>.message" --format pretty 

opa eval --data policies/gcp --input "inputs/gcp/access_context_manager_vpc_service_controls/access_context_manager_service_perimeter/status/tfplan.json" "data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.status.details" --format pretty


# Issues
## No policy template file

## Low quality videos
https://deakin365.sharepoint.com/sites/HardhatEnterprises2/_layouts/15/stream.aspx?id=%2Fsites%2FHardhatEnterprises2%2FShared%20Documents%2F%F0%9F%95%B9%20Policy%20Deployment%20Engine%2FT3%202025%2FInstructional%20Demos%2FPolicy%20Writing%2F2%20%2D%20Nested%20Attributes%2Emkv&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2E21518be9%2Df763%2D4adc%2Dbcdd%2Da76b0f836c59


## parentheses in service names
The error is caused by invalid characters in the Rego package name. Rego package identifiers can only contain:

Letters (a-z, A-Z)
Numbers (0-9)
Underscores (_)
The package name contains parentheses () which are not allowed:

## use lowercase for folder names

## policy
should it be scenario_list:= [] or conditions := []
