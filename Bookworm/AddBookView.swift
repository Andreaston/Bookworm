//
//  AddBookView.swift
//  Bookworm
//
//  Created by André on 29/10/2026.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]


    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nombre del libro", text: $title)
                    TextField("Nombre autor", text: $author)

                    Picker("Genero", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                /*
                Section("Escribe uan reseña") {
                    TextEditor(text: $review)

                    Picker("Puntuación", selection: $rating) {
                        ForEach(0..<6) {
                            Text(String($0))
                        }
                    }
                }*/
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RaitingView(rating: $rating)
                }

                Section {
                    Button("Guardar") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Añadir libro")
        }
    }
}

#Preview {
    AddBookView()
}
