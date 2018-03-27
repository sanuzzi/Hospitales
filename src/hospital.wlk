class Hospital {
	var curadores = []
	var pacientesAtendidos = []
	var slogan = "Haciendo todo para que vuelvas"

	method slogan() = slogan
	method slogan(nuevoSlogan){
		slogan = nuevoSlogan
	}

	method curadores() = curadores
	method curadores(nuevosCuradoress){
		curadores = nuevosCuradoress
	}

	method agregaCurador(unCurador) = self.curadores().add(unCurador)

	method pacientesAtendidos() = pacientesAtendidos
	method pacientesAtendidos(nuevosPacientesAtendidos){
		pacientesAtendidos = nuevosPacientesAtendidos
	}

	method calidad() = self.curadores().sum({curador => curador.calidad()})

	method fama() = self.chismeDePacientes() * self.calidad()

	method chismeDePacientes() = pacientesAtendidos.sum({paciente =>paciente.chisme()})

	method dasDesconfianza() = self.calidad() < 100 || self.fama() < 1000

	method cura(unPaciente){
		self.peorCurador().cura(unPaciente)
		self.pacientesAtendidos().add(unPaciente)
	}

	method peorCurador() = self.curadores().min({doctor => doctor.calidad()})

	method eliminaCuradores(){
		self.curadores([])
	}

	method limpiaHistrialDePacientes(){
		self.pacientesAtendidos([])
	}

	method atendiste(unPaciente) = self.pacientesAtendidos().contains(unPaciente)
}

class Doctor {
	var calidad = 0

	method calidad() = calidad
	method calidad(nuevaCalidad) {
		calidad = nuevaCalidad
	}

	// Comentario sin sentido
	// Línea 5888!!!!

	// A veeerr
	method aumentaCalidad(puntosParaAumentar) {
		self.calidad(self.calidad() + puntosParaAumentar)
	}

	method cura(unPaciente){
		const vidaOriginal = unPaciente.vida()
		unPaciente.vida(100)
		self.aumentaCalidad(100 - vidaOriginal)
	}
}

class Paciente {
	var vida
	const nivelDeChisme

	constructor(unaVida, unNivelDeChisme){
		nivelDeChisme = unNivelDeChisme
		self.vida(unaVida)
	}


	method vida() = vida
	method vida(nuevaVida){
		vida = nuevaVida
	}

	method chisme() = nivelDeChisme

	method enfermate(){
		self.vida(10)
	}

	method curate(){
		self.vida(100)
	}
}
