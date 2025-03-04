//
//  APIService.swift
//  catch-them-all
//
//  Created by Мария Анисович on 04.03.2025.
//

import Foundation

final class APIService {
    func fetchPokemonList(limit: Int = 10) async throws -> PokemonsData {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=\(limit)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let decoded = try JSONDecoder().decode(PokemonsData.self, from: data)

        return decoded
    }
    
    func fetchPokemonDetails(for pokemonEntries: [Pokemon]) async throws -> [PokemonModel] {
        var pokemonArray: [PokemonModel] = []
        
        for entry in pokemonEntries {
            guard let url = URL(string: entry.url) else { continue }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let pokemon = try JSONDecoder().decode(PokemonModel.self, from: data)
            
            pokemonArray.append(pokemon)
        }
        
        return pokemonArray
    }
}
