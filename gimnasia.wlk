class Rutina {


    method caloriasQuemadas(tiempo){
           return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()           
    }


    method descanso(tiempo)


    method intensidad()   

}





class Running inherits Rutina{

    var property intensidad
     

    override method descanso(tiempo){
        if (tiempo > 20){
            return 5
        } else {
            return 2
        }
    }
    
}





class Maraton inherits Running {

    override method caloriasQuemadas(tiempo){
        return (100 * (tiempo - self.descanso(tiempo)) * intensidad) * 2  
    }

}




class Remo inherits Rutina{

   override method intensidad(){
    return 1.3
   }


    override method descanso(tiempo){
        return tiempo / 5
    } 

}





class RemoCompetitivo inherits Remo {

    override method intensidad(){
        return 1.7
    }


    override method descanso(tiempo){
        return ((tiempo / 5)-3).max(2)
    }
   
}





class Persona {

    var property peso


    method pesoPerdido(rutina){
        return rutina.caloriasQuemadas(self.tiempo()) / self.calorias()
    }


    method practicarRutina(rutina){
        self.validarAplicarARutina(rutina)
        peso = peso - self.pesoPerdido(rutina)
    }


    method validarAplicarARutina(rutina)


    method calorias()

    method tiempo()

}






class PersonaSedentaria inherits Persona {

    var property tiempo             


    override method calorias(){
        return 7000
    }


    override method validarAplicarARutina(rutina){
        if(peso <= 50){
            self.error("la persona no puede practicar la rutina")
        }
    }   

}






class PersonaAtleta inherits Persona {


    override method pesoPerdido(rutina){
        return super(rutina) - 1
    }



    override method validarAplicarARutina(rutina){
        if (rutina.caloriasQuemadas(self.tiempo()) < 10000){
            self.error("la persona no puede practicar la rutina")
        }
    }



    override method calorias(){
        return 8000
    }


    override method tiempo(){
        return 90
    }

}




class Club {

    const predios = #{}

    method agregarPredio(predio){
        predios.add(predio)
    }


    method elMejorPredioPara(persona){
        return predios.max({predio => predio.caloriasQueQuemaHaciendoTodas(persona)})
    }
}




class Predio {

    const rutinas = #{}

    method agregarRutina(rutina){
        rutinas.add(rutina)
    }

    method caloriasQueQuemaHaciendoTodas(persona){
        return rutinas.sum({rutina => rutina.caloriasQuemadas(persona.tiempo())})
    }
}