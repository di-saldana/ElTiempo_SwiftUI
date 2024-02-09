//
//  ContentView.swift
//  ElTiempoSwiftUI
//
//  Created by Otto Colomina Pardo on 21/1/22.
//

import SwiftUI


struct ContentView: View {
    @State private var localidad = ""
    @State private var estadoTiempo = ""
    @State private var imagenTiempo: UIImage? = nil
    
    let modelo = TiempoModelo()
    
    var body: some View {
        Form {
            Section {
                TextField("Introduce la localidad", text: $localidad)
                Button("Ver el tiempo") {
                    consultarTiempo()
                }
            }
            if !estadoTiempo.isEmpty {
                Section {
                    Text(estadoTiempo)
                    if let imagenTiempo = imagenTiempo {
                        Image(uiImage: imagenTiempo)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
    }
    
    func consultarTiempo() {
        modelo.consultarTiempoActual(localidad: localidad) { 
            texto, direccionIcono in
            DispatchQueue.main.async {
                estadoTiempo = texto
                if let url = URL(string: direccionIcono) {
                    descargarImagenDesdeURL(url)
                }
            }
        }
    }
    
    func descargarImagenDesdeURL(_ url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error al descargar la imagen:", error?.localizedDescription ?? "Error desconocido")
                return
            }
            DispatchQueue.main.async {
                imagenTiempo = UIImage(data: data)
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
