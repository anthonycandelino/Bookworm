//
//  AddBookView.swift
//  Bookworm
//
//  Created by Anthony Candelino on 2024-08-27.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Please choose"
    @State private var review = ""
    
    let genres = ["Please choose", "Fantasy", "Horror", "Kids", "Poetry", "Romance", "Thriller"]
    private var isFormComplete: Bool {
        !title.isEmpty && !author.isEmpty && genre != genres[0] && !review.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    .disabled(!isFormComplete)
                }
            }
        }
    }
}

#Preview {
    AddBookView()
}
