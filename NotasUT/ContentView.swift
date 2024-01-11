//
//  ContentView.swift
//  NotasUT
//
//  Created by Marco Alonso Rodriguez on 11/01/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var viewModel: ViewModel = .init()
    @State var showCreateNote = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(value: note) {
                        VStack {
                            Text(note.title)
                                .foregroundStyle(.primary)
                            
                            Text(note.getText)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button(action: {
                        showCreateNote.toggle()
                    }, label: {
                        Label("Crear Nota", systemImage: "square.and.pencil")
                            .labelStyle(TitleAndIconLabelStyle())
                    })
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .bold()
                }
            }
            .navigationTitle("Notas")
            .navigationDestination(for: Note.self, destination: { note in
                UpdateNoteView(viewModel: viewModel, id: note.id, title: note.title, text: note.getText)
            })
            .fullScreenCover(isPresented: $showCreateNote, content: {
                CreateNoteView(viewModel: viewModel)
            })
        }
    }
}

#Preview {
    ContentView(viewModel: .init(notes: [
        Note(title: "Estudiar ", text: "Swift", createdAt: .now),
        Note(title: "Bañarme ", text: "Antes de la 1 pm", createdAt: .now),
    ]))
}
