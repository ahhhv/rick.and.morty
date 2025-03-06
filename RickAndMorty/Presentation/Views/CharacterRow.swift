struct CharacterRow: View {
    let character: Character
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                Text(character.status)
                    .font(.subheadline)
                    .foregroundColor(character.status == "Alive" ? .green : .red)
            }
        }
    }
}
