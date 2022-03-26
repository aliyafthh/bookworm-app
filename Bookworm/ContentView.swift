//
//  ContentView.swift
//  Bookworm
//
//  Created by Aliya Fatihah Mohamed Sidek on 25/03/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title), SortDescriptor(\.author)]) var books: FetchedResults<Book>

    @State private var showingAddScreen = false
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let book = books[offset]

            // delete it from the context
            moc.delete(book)
        }

        // save the context
        try? moc.save()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                if(book.rating == 1){
                                    Text(book.title ?? "Unknown Title")
                                        .font(.headline)
                                        .foregroundColor(.red)
                                }else {
                                    Text(book.title ?? "Unknown Title")
                                        .font(.headline)
                                }
                                
                                    
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
               .navigationTitle("Bookworm")
               .toolbar {
                   ToolbarItem(placement: .navigationBarTrailing) {
                       Button {
                           showingAddScreen.toggle()
                       } label: {
                           Label("Add Book", systemImage: "plus")
                       }
                   }
                   ToolbarItem(placement: .navigationBarLeading) {
                       EditButton()
                   }
                   
               }
               .sheet(isPresented: $showingAddScreen) {
                   AddBookView()
               }
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
