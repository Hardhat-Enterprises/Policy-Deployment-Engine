# Firestore Owner-Only Write Policy

## Service
Firebase → Firestore

## Description
Ensures Firestore documents contain an `ownerId` field.  
Prevents creation of documents without explicit ownership.

## Files
- `policy.rego`: Rego policy that checks for missing `ownerId`.
- `vars.rego`: Declares supported resource types.

## Test
Run with:
```bash
terraform init
terraform plan --out=plan
terraform show -json plan > plan.json
opa eval -i plan.json -d policy.rego -d vars.rego "data.gcp.firebase.firestore.owner_write.deny"
