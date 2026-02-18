#!/usr/bin/env bash

set -euo pipefail

SOURCE_REPO="${1:-../intelligent-litigation-services}"

if [[ ! -d "${SOURCE_REPO}" ]]; then
  echo "Source repository not found: ${SOURCE_REPO}" >&2
  exit 1
fi

cd "${SOURCE_REPO}"

commit="$(git rev-parse --short HEAD)"
checked_on="$(date '+%Y-%m-%d')"

frontend_routes="$(rg -n '<Route path="' App.tsx | wc -l | tr -d ' ')"
nav_links="$(rg -n "\\{ type: 'link' as const, path:" App.tsx | wc -l | tr -d ' ')"
backend_route_files="$(find server/src/routes -type f -name '*.ts' | wc -l | tr -d ' ')"
backend_handlers="$(rg -n "router\\.(get|post|put|patch|delete)\\(" server/src/routes -g '*.ts' | wc -l | tr -d ' ')"
prisma_models="$(rg -n '^model\s+' prisma/schema.prisma | wc -l | tr -d ' ')"
prisma_migrations="$(find prisma/migrations -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
service_files="$(find server/src/services -type f -name '*.ts' | wc -l | tr -d ' ')"
frontend_components="$(find components -type f -name '*.tsx' | wc -l | tr -d ' ')"

cat <<EOF
commit=${commit}
checked_on=${checked_on}
frontend_routes=${frontend_routes}
nav_links=${nav_links}
backend_route_files=${backend_route_files}
backend_handlers=${backend_handlers}
prisma_models=${prisma_models}
prisma_migrations=${prisma_migrations}
service_files=${service_files}
frontend_components=${frontend_components}
EOF
