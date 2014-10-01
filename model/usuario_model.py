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

	def getUserLogin(self, mailx):
		try:
			query = cur.select("select id_usuario, password from usuario where mail='%s';" %( mailx ))
			return query
		except:
			return (-1)		

	def getUserByName(self, mailx):
		try:
			query = cur.select("select id_usuario, mail, password, nombre, fecha_nacimiento, sexo from usuario where mail='%s';" %( mailx ))
			return query
		except:
			return (-1)
