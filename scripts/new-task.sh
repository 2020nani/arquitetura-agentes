#!/usr/bin/env bash
set -euo pipefail
ID=${1:?Informe o ID, ex: 001}
SLUG=${2:?Informe o slug}
FILE="tasks/backlog/${ID}-${SLUG}.md"
cp templates/task-template.md "$FILE"
sed -i "s/TASK-XXX/TASK-${ID}/g; s/Título da tarefa/${SLUG//-/ }/g" "$FILE"
echo "Created: $FILE"
