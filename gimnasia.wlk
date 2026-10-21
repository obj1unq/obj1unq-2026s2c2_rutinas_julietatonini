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