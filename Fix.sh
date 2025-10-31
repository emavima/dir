#!/usr/bin/env bash
set -euo pipefail

OUTFILE=".env"
BACKUP=".env.bak.$(date +%Y%m%d%H%M%S)"

if [ -f "$OUTFILE" ]; then
  echo "An existing $OUTFILE was found. Backing it up to $BACKUP"
  cp -a "$OUTFILE" "$BACKUP"
fi

cat > "$OUTFILE" <<'EOF'


API_KEY=APIKEY-0000-1111-2222
DB_PASSWORD=db-pass-AB12-CD34
USER_TOKEN=JWT-TOKEN-LABELLED-XXXX
ATTACK_FLAG=FLAG-EXAMPLE-2025
PLACEHOLDER_TEMPLATE={{PLACEHOLDER_LABELLED}}
EOF

chmod 777 "$OUTFILE" || true
echo "Set permissions to 777 for $OUTFILE"
ls -l "$OUTFILE"