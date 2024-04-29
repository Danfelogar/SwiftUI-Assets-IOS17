//
//  APICalls.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel Felipe on 28/04/24.
//

import SwiftUI

struct APICalls: View {
    //MARK: - Props
    @State private var user: GitHubUser?
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundStyle(.secondary)
            }
            .frame(width: 120, height: 120)
            
            Text(user?.login ?? "login Placeholder")
                .bold()
                .font(.title3)
            
            Text(user?.bio ?? "BioPlaceholder")
                .padding()
            
            Spacer()
        }
        .padding()
        .task {
            do {
                user = try await getUser()
            } catch GitHubErrors.invalidURL {
                print("invalid url")
            } catch GitHubErrors.invalidResponse {
                print("invalid response")
            } catch GitHubErrors.invalidData {
                print("invalid Data")
            } catch {
                print("was wornt")
            }
        }
    }
    
    //MARK: - logic
    func getUser() async throws -> GitHubUser {
        let endpoint = "https://api.github.com/users/sallen0400"
        
        guard let url = URL(string: endpoint) else { throw GitHubErrors.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GitHubErrors.invalidResponse
        }
        
        do {
            let  decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            throw GitHubErrors.invalidData
        }
    }
}

struct APICalls_Previews: PreviewProvider {
    static var previews: some View {
        APICalls()
    }
}


//Model
struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String
    let bio: String
}

enum GitHubErrors: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
