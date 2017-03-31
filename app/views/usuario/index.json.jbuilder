json.usuarios @usuarios do |usuario|
	
	json.id usuario.id
	json.nombre usuario.nombre
	json.apellido usuario.apellido
	json.usuario usuario.usuario
	json.twitter usuario.twitter

end

json.total @usuarios.count