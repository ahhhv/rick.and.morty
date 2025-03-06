struct CharacterDTO: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
    let episode: [String]
    
    func toDomain() -> CharacterEntity {
        return CharacterEntity(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            image: image,
            episode: episode
        )
    }
}
