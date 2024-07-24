struct Users: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
    
//    internal init(id: Int, name: String, username: String, email: String, address: Address, phone: String, website: String, company: Company) {
//        self.id = id
//        self.name = name
//        self.username = username
//        self.email = email
//        self.address = address
//        self.phone = phone
//        self.website = website
//        self.company = company
//    }
}

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat, lng: String
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}


//extension Users: CustomStringConvertible {
//    var description: String {
//        let info =
//"""
//user:\(id)
//username:\(username)
//address:\(Address(street: address.street , suite: address.suite, city: address.city, zipcode: address.zipcode, geo: Geo(lat: address.geo.lat, lng: address.geo.lng)))
//company:\(Company(name: company.name, catchPhrase: company.catchPhrase, bs: company.bs))
//"""
//        return info
//    }
//}
