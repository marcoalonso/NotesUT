//
//  CreateNoteView.swift
//  NotasUT
//
//  Created by Marco Alonso Rodriguez on 11/01/24.
//

import SwiftUI

struct CreateNoteView: View {
    var viewModel: ViewModel
    @State var title: String = ""
    @State var text: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("", text: $title, prompt: Text( "*Título"), axis: .vertical)
                    TextField("", text: $text, prompt: Text( "*Texto"), axis: .vertical)
                } footer: {
                    Text("* El título es obligatorio")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cerrar")
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        viewModel.createNoteWith(title: title, text: text)
                        dismiss()
                    }, label: {
                        Text("Crear Nota")
                    })
                }
            }
            .navigationTitle("Nueva Nota")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    CreateNoteView(viewModel: .init())
}
