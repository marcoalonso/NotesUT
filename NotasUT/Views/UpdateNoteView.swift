//
//  UpdateNoteView.swift
//  NotasUT
//
//  Created by Marco Alonso Rodriguez on 11/01/24.
//

import SwiftUI

struct UpdateNoteView: View {
    var viewModel: ViewModel
    let id: UUID
    
    @State var title: String = ""
    @State var text: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("", text: $title, prompt: Text( "*Título"), axis: .vertical)
                    TextField("", text: $text, prompt: Text( "*Texto"), axis: .vertical)
                }
            }
            Button(action: {
                viewModel.removeNoteWith(id: id)
                dismiss()
            }, label: {
                Text("ELiminar Nota")
                    .foregroundStyle(.gray)
                    .underline()
            })
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    viewModel.updateNoteWith(id: id, newTitle: title, newText: text)
                    dismiss()
                }, label: {
                    Text("Guardar")
                })
            }
        }
        .navigationTitle("Modificar Nota")
    }
}

#Preview {
    NavigationStack {
        UpdateNoteView(viewModel: .init(), id: .init(), title: "Estudiar Swift", text: "Necesito repasar mas cosas, como unit testing, mas apps para tener mas experiencia.")
    }
}
