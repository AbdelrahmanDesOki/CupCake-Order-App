
//1
//import data from itunes API
//
//import SwiftUI
//
//struct Response: Codable {
//    var results: [Result]
//}
//
//struct Result: Codable {
//    var trackId: Int
//    var trackName: String
//    var collectionName: String
//}
//
//
//class User: ObservableObject, Codable {
//    
//    enum CodingKeys: CodingKey{
//        case name
//    }
//    var name = "DEsokii"
//    
//    required init(from decoder: Decoder)
//    throws {
//        
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        //  (Decoder) contains all our data, but it’s up to us to figure out how to read it.
//        name = try container.decode(String.self, forKey: .name)
//           }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//    }
//}
//
//
//struct ContentView: View {
//    @State private var results = [Result]()
//    
//    
//    var body: some View {
//        List(results, id: \.trackId) { item in
//                    VStack(alignment: .leading) {
//                        Text(item.trackName)
//                            .font(.headline)
//                        Text(item.collectionName)
//                    }
//                }
//        .task {
//            await LoadData()
//        }
//    }
//    
//    func LoadData() async{
//        guard let url = URL (string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")else{
//            print("Invalid URL !!")
//            return
//        }
//        
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//
//            if let decodedResponse =
//                try? JSONDecoder().decode(Response.self, from: data) {
//                results = decodedResponse.results
//            }
//            
//        } catch {
//            print("Invalid data")
//        }
//         
//        
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

//2
// Handling Image from Internet and using AsyncImage

//struct ContentView: View {
//
//
//    var body: some View {
//
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){
//            phase in
//            
//            if let image = phase.image{
//                image
//                    .resizable()
//                    .scaledToFit()
//            }
//            else if phase.error != nil
//            {
//                Text("There was an erroR downloading this Photo!!")
//            }
//            else{
//                ProgressView()
//            }
//        }
//        .frame(width: 200, height: 200)
//    }
//}

//3
// Putting conditions on input from text field


//struct ContentView: View {
//
//    @State private var USername = ""
//    @State private var Email = ""
//
//    var body: some View {
//
//        Form{
//            Section{
//                TextField("Username", text: $USername)
//                TextField("Email address", text: $Email)
//
//            }
//
//            Section{
//                Button("Create account"){
//                    print("Creating an account")
//                }
//            }
//            .disabled(disableForm)
//        }
//
//    }
//    var disableForm: Bool {
//        USername.count < 5 || !Email.contains("@") || Email.count < 5
//    }
//}
