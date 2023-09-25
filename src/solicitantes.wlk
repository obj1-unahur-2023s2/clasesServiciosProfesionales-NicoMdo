import profesionales.*

class Persona {
	var property provinciaDondeVive
	
	method puedeSerAtendidoPor(unProfesional){
		return unProfesional.provinciasDondePuedeTrabajar().contains(provinciaDondeVive)
	}
}

class Institucion {
	const universidadesQueReconoce = #{}
	
	method puedeSerAtendidoPor(unProfesional){
		return universidadesQueReconoce.contains(unProfesional.universidad())
	}
}

class Club {
	const provincias = #{}
	
	method puedeSerAtendidoPor(unProfesional){
		return not provincias.intersection(unProfesional.provinciasDondePuedeTrabajar()).isEmpty()
	}
	
}
