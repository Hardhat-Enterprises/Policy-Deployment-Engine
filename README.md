# Policy-Deployment-Engine

pip requirements pending

if errors, just do pip install for those libraries

Assumed there are similar templates in aws and azure folder

cd inputs/gcp/cloud_platform_service/google_project/billing_account

cd ../../../../..

terraform plan --out=plan && terraform show -json plan > plan.json
