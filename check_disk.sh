
seul=${1:-80}
UTILISATION=$(df / | awk 'NR==2 {'print $5'}' | tr -d '%')
if ["$UTILISATION" -ge "seul"]; then 
echo "Alerte :l'espace de disque utilisé dépasse le seul "
exit 1 
else 
echo "OK ,l'esoace de disque est normal "
exit 0
fi 

