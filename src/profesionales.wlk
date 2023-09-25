class ProfesionalAsociado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrar(unImporte){
		asociacionProfesionalesDelLitoral.recibirDonacion(unImporte)
	}
}


class ProfesionalVinculado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method honorariosPorHora(){
		return universidad.honorariosRecomendados()
	}
	method provinciasDondePuedeTrabajar(){
		return #{universidad.provincia()}
	}
	
	method cobrar(unImporte){
		universidad.recibirDonacion(unImporte / 2)
	}
}

class ProfesionalLibre {
	var property universidad
	const property provinciasDondePuedeTrabajar = #{}
	var property honorariosPorHora
	var totalRecaudado = 0
	
	method cobrar(unImporte){
		totalRecaudado += unImporte
	}
	
	method pasarDinero(unProfesional, unValor){
		unProfesional.cobrar(unValor.min(totalRecaudado))
		totalRecaudado -= unValor.min(totalRecaudado)
	}
	
	method provinciasDondePuedeTrabajar(unaProv){
		provinciasDondePuedeTrabajar.add(unaProv)
	}
		
}

class Universidad{
	var property provincia
	var property honorariosRecomendados
	var donacionesTotales = 0
	
	method recibirDonacion(unValor){
		donacionesTotales += unValor
	}
}

object asociacionProfesionalesDelLitoral{
	var donacionesTotales = 0
	
	method recibirDonacion(unValor){
		donacionesTotales += unValor
	}	
	
}



