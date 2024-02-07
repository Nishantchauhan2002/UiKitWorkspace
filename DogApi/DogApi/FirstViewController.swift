import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var mycollectionview: UICollectionView!
    
    var dogAllData:Dogdata?
    var DogImageAllLinks = [String]()
    
    
    func fetchData(){
        let url=URL(string: "https://dog.ceo/api/breed/labrador/images")
        let task=URLSession.shared.dataTask(with: url! , completionHandler:{
            (data,response,error) in
            guard let data = data, error == nil else {
                print("Error Occured While accessing data")
                return
            }
            var dogObject:Dogdata?
            do{
                dogObject = try JSONDecoder().decode(Dogdata.self, from: data)
                
                
            }catch{
                print("Error occured decoding json into swift structure \(error)")
            }
            
            self.dogAllData=dogObject
            self.DogImageAllLinks=self.dogAllData!.message
            DispatchQueue.main.async {
                self.mycollectionview.reloadData()
            }
        })
        task.resume()
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            fetchData()
            
            
            mycollectionview.dataSource=self
            mycollectionview.delegate=self
            
            
            mycollectionview.register(CollectionViewCell.nib()
                                      , forCellWithReuseIdentifier: CollectionViewCell.identifier)
            
        }
        
        
    }
    
    extension UIImageView{
        func downloadImage(from url:URL){
            contentMode = .scaleToFill
            let dataTask = URLSession.shared.dataTask(with: url, completionHandler: {
                    (data, response, error ) in
                guard let httpURLResponse = response as? HTTPURLResponse ,httpURLResponse.statusCode
                        == 200,
                      let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                      let data = data , error == nil ,
                      let image = UIImage(data: data)
                else{
                    return
                }
                DispatchQueue.main.async{
                    self.image=image
                }

            })
            dataTask.resume()
        }
    }
extension FirstViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DogImageAllLinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell=mycollectionview.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        let urlImage=URL(string:DogImageAllLinks[indexPath.row])
        cell.img.downloadImage(from: urlImage!)
        cell.img.layer.cornerRadius=25
        return cell
    }
}
