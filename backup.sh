
#!/bin/bash
set -Eeuo pipefail


DOSSIER="${1:-data}"
DESTINATION="backups"


if [ ! -d "$DOSSIER" ]; then
    echo "Erreur : le dossier $DOSSIER n'existe pas." >&2
    exit 1
fi


mkdir -p "$DESTINATION"


DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="$DESTINATION/backup_$DATE.tar.gz"


tar -czf "$ARCHIVE" "$DOSSIER"

echo "Sauvegarde creee : $ARCHIVE"


for fichier in "$DESTINATION"/*.tar.gz; do
    [ -e "$fichier" ] || continue

    if [ "$(find "$fichier" -mtime +7 -print)" ]; then
        rm "$fichier"
        echo "Ancienne sauvegarde supprimee : $fichier"
    fi
done


echo "Sauvegarde terminee."

