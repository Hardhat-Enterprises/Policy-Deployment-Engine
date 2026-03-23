# Firebase App Check Security Policies

This document provides a consolidated overview of the 5 security-relevant policies implemented for Firebase App Check. These policies ensure that App Check is configured according to security best practices to prevent unauthorized access and potential credential exposure.

## 1. SHA-256 Fingerprint Enforcement
**Resource**: `google_firebase_android_app`
**Policy**: `sha_hashes`
**Security Rationale**: Firebase Android apps should have at least one SHA-256 certificate hash defined. Enforcement of SHA-256 hashes prevents unauthorized clients from impersonating the app.
**Logic**: Denies if `sha256_hashes` is null or empty.

## 2. DeviceCheck Private Key Management
**Resource**: `google_firebase_app_check_device_check_config`
**Policy**: `private_key` (via Secret Manager)
**Security Rationale**: Hardcoding Apple DeviceCheck private keys in Terraform increases the risk of credential exposure.
**Logic**: Enforces the use of Secret Manager resource references (`projects/*/secrets/*`) instead of literal key strings.

## 3. reCAPTCHA v3 Site Secret Management
**Resource**: `google_firebase_app_check_recaptcha_v3_config`
**Policy**: `site_secret` (via Secret Manager)
**Security Rationale**: Hardcoding reCAPTCHA site secrets in Terraform increases the risk of credential exposure.
**Logic**: Enforces the use of Secret Manager resource references (`projects/*/secrets/*`).

## 4. App Check Enforcement Mode
**Resource**: `google_firebase_app_check_service_config`
**Policy**: `enforcement_mode`
**Security Rationale**: Without `ENFORCED` mode, App Check only logs activity without actually blocking unverified requests, leaving the service vulnerable.
**Logic**: Ensures `enforcement_mode` is explicitly set to `ENFORCED`.

## 5. App Check Token TTL
**Resource**: `google_firebase_app_check_device_check_config`
**Policy**: `token_ttl`
**Security Rationale**: A shorter token TTL (Time-To-Live) reduces the window of opportunity for intercepted bearer tokens to be replayed by an attacker. 24 hours is considered a sensible default for balancing security and user experience.
**Logic**: Denies if `token_ttl` exceeds 86400s (24 hours).

---
*Last updated: 2026-03-21*
