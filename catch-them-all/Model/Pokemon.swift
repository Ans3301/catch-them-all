//
//  Pokemon.swift
//  catch-them-all
//
//  Created by Мария Анисович on 04.02.2025.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let url: String
}

struct PokemonsData: Decodable {
    let results: [Pokemon]
}

struct Ability: Decodable {
    let name: String
}

struct AbilityWrapper: Decodable {
    let ability: Ability
}

struct PokemonModel: Decodable {
    let name: String
    let abilities: [AbilityWrapper]
    let imageUrl: String

    enum CodingKeys: String, CodingKey {
        case name, abilities, sprites
    }

    enum SpritesKeys: String, CodingKey {
        case other
    }

    enum OtherKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }

    enum ArtworkKeys: String, CodingKey {
        case frontDefault = "front_default"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        abilities = try container.decode([AbilityWrapper].self, forKey: .abilities)

        let spritesContainer = try container.nestedContainer(keyedBy: SpritesKeys.self, forKey: .sprites)
        let otherContainer = try spritesContainer.nestedContainer(keyedBy: OtherKeys.self, forKey: .other)
        let artworkContainer = try otherContainer.nestedContainer(keyedBy: ArtworkKeys.self, forKey: .officialArtwork)
        imageUrl = try artworkContainer.decode(String.self, forKey: .frontDefault)
    }
}
