#!/usr/bin/env bash
# Mimic a real client: register (optional) → create package → send plan to API check.
#
# Credentials (~/.pde-gate/credentials.json, or PDE_CREDENTIALS_FILE):
#   --register   new org: saves the API key (for check) and a 12-hour session (for package)
#   --login      saves a new session; the API key already saved for that org is kept
#   (no flag)    uses what is saved: a current session and the org's API key
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
CLI="$ROOT/tools/pde-gate"
API_URL="${PDE_API_URL:-http://127.0.0.1:3847}"
DEMO="$(cd "$(dirname "$0")" && pwd)"

cd "$CLI"
# shellcheck disable=SC1091
source ~/.nvm/nvm.sh 2>/dev/null || true
nvm use >/dev/null 2>&1 || true

export PDE_API_URL="$API_URL"

echo "== health =="
curl -sf "$API_URL/health" | grep -q '"status":"ok"\|"status": "ok"' || {
  echo "API not healthy at $API_URL — start tools/pde-gate-api (nvm use && npm start)" >&2
  exit 1
}
echo "ok"

if [[ "${1:-}" == "--register" ]]; then
  echo "== register new org =="
  DEMO_EMAIL="client-mimic-$RANDOM@example.com"
  npx tsx src/cli.ts register --name "Client Mimic Org" --email "$DEMO_EMAIL" --password "client-secret-123"
elif [[ "${1:-}" == "--login" ]]; then
  echo "== login existing org =="
  npx tsx src/cli.ts login --email "${2:-client-mimic@example.com}" --password "${3:-client-secret-123}"
fi

echo "== status =="
npx tsx src/cli.ts status

echo "== create package from samples/client-mimic/package.json =="
CREATE_OUT="$(npx tsx src/cli.ts package create --file "$DEMO/package.json")"
echo "$CREATE_OUT"
PKG_ID="$(echo "$CREATE_OUT" | sed -n 's/^PDE_GATE_PACKAGE_CREATED //p')"
if [[ -z "$PKG_ID" ]]; then
  echo "Failed to parse package_id" >&2
  exit 1
fi

echo "== package list =="
npx tsx src/cli.ts package list

echo "== check plan (expect FAIL: legacy-connector region and ip_cidr_range) =="
set +e
npx tsx src/cli.ts check --plan "$DEMO/plan.json" --package "$PKG_ID" --platform gcp
CODE=$?
set -e

echo "== done exit=$CODE (0 pass, 1 policy failure — expected here, 2 error) =="
exit "$CODE"
