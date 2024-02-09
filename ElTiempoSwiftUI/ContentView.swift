//
//  ContentView.swift
//  ElTiempoSwiftUI
//
//  Created by Otto Colomina Pardo on 21/1/22.
//

import SwiftUI

struct ContentView: View {
    let modelo = TiempoModelo()
    let ciudades = ["Sanvi", "Londres", "Paris"]
    
    @State private var ciudad = 0
    @State private var nombre = ""
    @State private var suscrito = false
    
    var body: some View {
        Form {
            Section {
                TextField("nombre:", text: $nombre)
                Picker("Lugar", selection: $ciudad) {
                    ForEach(0..<ciudades.count) { num in
                        Text("\(self.ciudades[num])")
                    }
                }.pickerStyle(WheelPickerStyle())
                Toggle("Suscribirse",isOn: $suscrito)
            }
            Section {
                Text("Hola,\(nombre) de \(ciudades[ciudad])")
                if suscrito {
                   Text("¡Gracias por suscribirte!")
                }
                else {
                   Text("¡Suscríbete, por favor!")
                }
            }
//            Section {
//                modelo.consultarTiempoActual(localidad: localidad) {
//                    texto, direccionIcono in
//                    //a partir de aquí, asignar "texto" y "direccionIcono" a propiedades @State
//                    //para que se repinte la vista
//                    //Ojo, tendrás que transformar direccionIcono String -> URL -> Data -> UIImage
//                }
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
 
 En general, intenta que primero se vea el texto con el estado del tiempo y una vez esté funcionando ocúpate del icono con la imagen, recuerda que este último hay que cargarlo desde una url y la cosa se complica un poco con él.
 Fíjate en la transparencia con el ejemplo de formulario
 Puedes por ejemplo hacer dos secciones, una para el campo de texto donde se escribe la localidad y el botón y otra para mostrar los resultados en forma de texto y en forma gráfica
 Los resultados solo los debes mostrar si no están vacíos, mira en la traspa cómo se hace para mostrar componentes de manera condicional
 Para comunicarnos con el servidor podemos reutilizar el código del modelo de la versión sin SwiftUI. Para consultar el tiempo necesitas crear una instancia de TiempoModelo y sobre ella llamar al método consultarTiempoActual(localidad:callback:)

 let modelo = TiempoModelo()
 ...
 modelo.consultarTiempoActual(localidad: localidad) {
     texto, direccionIcono in
     //a partir de aquí, asignar "texto" y "direccionIcono" a propiedades @State
     //para que se repinte la vista
     //Ojo, tendrás que transformar direccionIcono String -> URL -> Data -> UIImage
 }
 
 */
