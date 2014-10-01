import sys
sys.path.append('model/')
import usuario_model


#FUNCIONES DEL USUARIO
class Fusuario(usuario_model.Usuario):

	def __init__(self):
		self.usuariox = usuario_model.Usuario()

	def login(self, mailx, passwordx):
		user = self.usuariox.getUserByMail(mailx)
		if (str(user)!= "None"):
			if(user[2] == passwordx):
				return user[0]
			else:
				return 0
		else:
			return 0
