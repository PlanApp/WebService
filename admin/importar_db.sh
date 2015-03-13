# Para ejecutar:
# ./importar_db.sh $nombre.sql
echo "Importando "$1
sleep 2
psql -U planapp -d planapp_db -f $1
