import profesionales.*
import solicitantes.*

class EmpresaDeServicios{
	var property honorarioDeReferencia
	const property profesionalesContratados = #{}
	const property clientes = #{}
	
	method contratarProfesional(profesional){
		profesionalesContratados.add(profesional)
	}
	
	method cuantosEstudiaronEn(universidad){
		return profesionalesContratados.count({c => c.universidad() == universidad})
	}
	
	method profesionalesCaros(){
		return profesionalesContratados.filter({c => c.honorariosPorHora() > self.honorarioDeReferencia()})
	}
	
	method universidadesFormadoras(){
		return profesionalesContratados.map({p => p.universidad()}).asSet()
	}
	
	method profesionalMasBarato() = profesionalesContratados.min({ p => p.honorariosPorHora()})
	
	method esDeGenteAcotada(){
		return not profesionalesContratados.any({p=>p.provinciasDondePuedeTrabajar().size() > 3 })
	}
	  //return  profesionalesContratados.all({p=>p.provinciasDondePuedeTrabajar().size() <= 3 })
	  
	method puedeSatisfacer(unSolicitante){
		return profesionalesContratados.any({ p=> unSolicitante.puedeSerAtendidoPor(p) })
	}
	
	method darServicio(unSolicitante){
		if (self.puedeSatisfacer(unSolicitante)){
			const unProfesional = profesionalesContratados.anyOne()
			unProfesional.cobrar(unProfesional.honorariosPorHora())
			clientes.add(unSolicitante)
		}
		else{
			self.error("No se puede dar servicio al solicitante")
		}
	}
	
	method cantidadDeClientes(){
		return clientes.size()
	}
	
	method tieneDeClienteA(unSolicitante){
		return clientes.contains(unSolicitante)
	}
	
	method esPocoAtractivo(unProfesional){
		return profesionalesContratados.any({p => unProfesional.provinciasDondePuedeTrabajar() == p.provinciasDondePuedeTrabajar() && unProfesional.honorariosPorHora() > p.honorariosPorHora()})
	}
	
}