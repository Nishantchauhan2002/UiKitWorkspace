import UIKit

struct GithubUser:Codable{
    
    let login:String
    let avatarUrl:String
//    let bio:String
    
}
class InterfaceViewController: UIViewController {

    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    var user:GithubUser?
    
    @IBOutlet weak var userDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
            do{
                let user = try await getUsers()
                await updateUI(with:user)
                
            }catch GHError.invalidURL{
                print("Invalid url")
            }catch GHError.invalidData{
                print("NOT GETTIGN THE VALID DATA ")
            }catch GHError.invalidResposne{
                print("Invalid response")
            }catch{
                print("unexpected error")
            }
        }
    }
    func updateUI(with user:GithubUser) async{
        userName.text=user.login
        userDescription.text="Doing Intern of IOS Developer in Droom Gurugram Haryana "
        
        do{
            try await updateImage(with:user.avatarUrl)
        }catch{
            print("Image not loaded successfully")
        }
        
    }
    
    func updateImage(with imageUrl:String) async throws{
        
        guard let url = URL(string: imageUrl) else{
            throw GHError.invalidURL
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let image = UIImage(data: data), let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw GHError.invalidData
        }
        UserImage.image=image
        UserImage.layer.cornerRadius = 50
        
        
        
    }
    
    
    func getUsers() async throws -> GithubUser{
        let endpoint="https://api.github.com/users/nishantchauhan2002"
        
        guard let url = URL(string: endpoint)else {
            throw GHError.invalidURL
            
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResposne
        }
        do{
            let decoder=JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GithubUser.self, from: data)
        }catch{
            print("data does not decoded")
            throw GHError.invalidData
        }
    }

}

enum GHError:Error{
    case invalidURL
    case invalidResposne
    case invalidData
    
}
