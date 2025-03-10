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

    func fetchPokemonDetails(for pokemons: [Pokemon]) async -> [PokemonModel] {
        let pokemonArray = await withTaskGroup(of: PokemonModel?.self, returning: [PokemonModel].self) { group in
            var results: [PokemonModel] = []

            for pokemon in pokemons {
                guard let url = URL(string: pokemon.url) else { continue }
                group.addTask {
                    do {
                        let (data, _) = try await URLSession.shared.data(from: url)
                        return try JSONDecoder().decode(PokemonModel.self, from: data)
                    } catch {
                        print(error.localizedDescription)
                        return nil
                    }
                }
            }

            for await result in group {
                if let res = result {
                    results.append(res)
                }
            }
            return results
        }
        return pokemonArray
    }
}
