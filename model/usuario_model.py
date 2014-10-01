import conexion
cur=conexion.pgsql();


class Usuario:
	def __init__(self):
		self.id_usuario=0
		self.mail=""
		self.nombre=""
		self.password=""
		self.fecha_nacimiento=""
		self.sexo=""

	def getUserByName(self, namex):
		try:
			query = cur.select("select id, name, password, rol from users where name='%s';" %( namex ))
			return query
		except:
			return (-1)
