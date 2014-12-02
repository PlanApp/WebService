import sys
sys.path.append('model/')
import usuario_model
import panoramas_model

#FUNCIONES PANORAMAS (HISTORICO)
class Fpanoramas(panoramas_model.Panoramas):
	def __init__(self):
		self.panoramasx = panoramas_model.Panoramas()

	def saveHistorico(self, id_user, id1, id2, id3):
		self.panoramasx.Insertar(id_user, id1, id2, id3)


#FUNCIONES DEL USUARIO
class Fusuario(usuario_model.Usuario):

	def __init__(self):
		self.usuariox = usuario_model.Usuario()

	def login(self, mailx, passwordx):
		user = self.usuariox.getUserLogin(mailx)
		if (str(user)!= "None"):
			if(user[1] == passwordx):
				return user[0]
			else:
				return 0
		else:
			return 0

	def getID(self, mailx):
		user_id = self.usuariox.ID(mailx)
		return user_id

	def registrar(self, mailx, nombrex, passwordx, fecha_nacimientox, sexox):
		self.usuariox.InsertarUsuario(mailx, nombrex, passwordx, fecha_nacimientox, sexox)

