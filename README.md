# Policy-Deployment-Engine

pip requirements pending

if errors, just do pip install for those libraries

Assumed there are similar templates in aws and azure folder

cd inputs/gcp/cloud_platform_service/google_service_account_key/exposure

cd ../../../../..

terraform plan --out=plan && terraform show -json plan > plan.json

terraform init && terraform plan --out=plan && terraform show -json plan > plan.json

# message

opa eval \
--data ./policies/gcp \
--input ./inputs/gcp/cloud_platform_service/google_service_account_key/exposure/plan.json "data.terraform.gcp.security.cloud_platform_service.google_service_account_key.exposure.message" \
--format pretty
