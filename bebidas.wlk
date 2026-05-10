
object whisky {
    method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
    method rendimientoQueOtorga(dosisConsumida) = (0.1 * dosisConsumida).max(1)
}

object cianuro {
    method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuado {

    var nutrientes = []

    method agregarNutriente(valor) {
        nutrientes.add(valor)
    }

    method rendimientoQueOtorga(dosisConsumida) {

        var litros = dosisConsumida / 1000
        return litros * nutrientes.sum()

    }

}

object aguaSaborizada {

    var bebidaBase = whisky

    method cambiarBase(nuevaBebida) {
        bebidaBase = nuevaBebida
    }

    method rendimientoQueOtorga(dosisConsumida) {

        var parteAgua = dosisConsumida * 0.75
        var parteBebida = dosisConsumida * 0.25

        return 1 + bebidaBase.rendimientoQueOtorga(parteBebida)

    }

}

object coctel {

    var bebidas = []

    method agregarBebida(b) { 
        bebidas.add(b)
    }

    method rendimientoQueOtorga(dosisConsumida) {

        return bebidas.map {
            b => b.rendimientoQueOtorga(dosisConsumida)
        }.product()

    }

}
