import conexion
cur=conexion.pgsql();


class Panoramas:
	def __init__(self):
		self.id_usuario=0
		self.id1=0;
		self.id2=0;
		self.id3=0;


	def Insertar(self, id_user, id1, id2, id3):
			#cur.insert("insert into usuario (mail, nombre, password, fecha_nacimiento, sexo) values ('%s', '%s', '%s', '%s', '%s');" %(mailx, nombrex, passwordx, fecha_nacimientox, sexox))
			cur.insert("insert into panorama (id_usuario, id_lugar1, id_lugar2, id_lugar3) values ('%s', '%s', '%s', '%s');" %(id_user, id1, id2, id3))	
		
