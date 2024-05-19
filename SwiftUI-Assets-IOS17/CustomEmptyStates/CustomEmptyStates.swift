//
//  CustomEmptyStates.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel Felipe on 19/05/24.
//

import SwiftUI

struct CustomEmptyStates: View {
    //States
    //    @State private var heroes = ["Luke", "Han", "Leia", "Chewbacca", "Yoda", "Obi-Wan"]
    @State private var heroes: [String] = []
    @State private var searchTerm = ""
    private let imgURL: String = "https://media.contentapi.ea.com/content/dam/star-wars-battlefront-2/images/2019/08/swbf2-refresh-hero-large-heroes-page-luke-skywalker-16x9-xl.jpg.adapt.crop3x2.1023w.jpg"
    
    //Methods
    var filteredHeroes: [String] {
        guard !searchTerm.isEmpty else { return heroes }
        return heroes.filter { $0.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    //View
    var body: some View {
        NavigationStack {
            VStack {
                if heroes.isEmpty {
                    //ContentUnavailableView("No Heroes",
                    //systemImage: "person.slash",
                    //description: Text("You need to create a hero to see it here.")
                    ContentUnavailableView(
                        label:{
                            VStack(spacing: 20) {
                                AsyncImage(url: URL(string: imgURL)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 130)
                                        .clipShape(Circle())
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                Text("No Heroes")
                                    .bold()
                            }//VStack
                        },
                        description:{
                            Text("Tap the button below to create a hero.")
                                .italic()
                            .foregroundStyle(.teal)},
                        actions:{
                            Button("Add Hero") {
                                //add hero code
                            }
                            .padding(7)
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(15)
                        })
                } else {
                    List(filteredHeroes, id: \.self) { hero in
                        Text(hero)
                    }//List
                    .searchable(text: $searchTerm)
                    .overlay {
                        if filteredHeroes.isEmpty {
                            ContentUnavailableView.search
                        }
                    }
                }
            }//VStack
            .navigationTitle("Heroes")
        }// NavigationStack
    }
}

#Preview { CustomEmptyStates() }
