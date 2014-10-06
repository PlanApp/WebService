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

	def getUserByMail(self, mailx):
		try:
			query = cur.select("select id_usuario, mail, password, nombre, fecha_nacimiento, sexo from usuario where mail='%s';" %( mailx ))
			return query
		except:
			return (-1)

	def ID(self, mail):
		try:
			query = cur.select("select id_usuario from usuario where mail='%s';" %( mailx ))
			return query[0]
		except:
			return (-1)
		

	def InsertarUsuario(self, mailx, nombrex, passwordx, fecha_nacimientox, sexox):
			#cur.insert("insert into usuario (mail, nombre, password, fecha_nacimiento, sexo) values ('%s', '%s', '%s', '%s', '%s');" %(mailx, nombrex, passwordx, fecha_nacimientox, sexox))
			cur.insert("insert into usuario (mail, nombre, password, fecha_nacimiento, sexo) values ('%s', '%s', '%s', '%s', '%s');" %(mailx, nombrex, passwordx, fecha_nacimientox, sexox))	
		
