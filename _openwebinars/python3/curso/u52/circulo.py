class circulo():
	def __init__(self,radio):
		self.set_radio(radio)
	def set_radio(self,radio):
		if radio>=0:
			self._radio = radio
		else:
			self._radio=0
			raise ValueError("Radio positivo")
			
	def get_radio(self):
		print("Estoy dando el radio")
		return self._radio
