import sys
sys.path.append('model/')
import usuario_model


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
