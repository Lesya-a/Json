import Alamofire

struct NetworkManager {
    static let instance = NetworkManager()
    
    enum Constants {
        static let baseURL = "https://jsonplaceholder.typicode.com"
    }
    
    enum EndPoints {
        static let users = "/users"
    }
    
    func getAllUsers(completion: @escaping (([Users]) -> Void)) {
        AF.request(Constants.baseURL + EndPoints.users).responseDecodable(of: [Users].self) { response in
            switch response.result {
            case .success(let data): completion(data)
            case .failure(let error): print(error)
            }
        }
    }
    private init() {}
}
