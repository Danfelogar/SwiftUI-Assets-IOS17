//
//  SearchBar.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel Felipe on 27/02/24.
//

import SwiftUI

struct SearchBar: View {
    //MARK: - Properties
    @State private var followers: [Follower] = []
    @State private var searchTerm = ""
    
    var filteredFollowers: [Follower] {
        guard !searchTerm.isEmpty else { return followers }
        return followers.filter { $0.login.localizedCaseInsensitiveContains(searchTerm) }
    }

    //MARK: - Body
    var body: some View {
        NavigationStack {
            List(filteredFollowers, id: \.id) { follower in
                HStack(spacing: 20) {
                    AsyncImage(url: URL(string: follower.avatarUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle()
                            .foregroundStyle(.secondary)
                    }
                    .frame(width: 44, height: 44)
                    
                    Text(follower.login)
                        .font(.title3)
                        .fontWeight(.medium)
                        .onTapGesture(perform: {
                            print("hello \(follower.avatarUrl)")
                        })
                }//: HStack
            }//: List
            .navigationTitle("Followers")
            .task { followers = await getFollowers() }
            .searchable(text: $searchTerm, prompt:"Search Followers")
        }//: Navigation
    }
    //This is down and dirty networking code to get it working. Copy at your own risk.
    func getFollowers() async -> [Follower] {
        let url = URL(string:"https://api.github.com/users/sallen0400/followers?per_page=100")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([Follower].self, from: data)
        } catch {
            print("Error al obtener seguidores: \(error)")
            return [] // Devuelve un array vacío o maneja el error como prefieras
        }
    }
}

#Preview { SearchBar() }
