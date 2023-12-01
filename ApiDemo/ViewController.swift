//
//  ViewController.swift
//  ApiDemo
//
//  Created by ASWIN A on 30/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableDetails: UITableView!
    
    var product: PhoneApi?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDetails.delegate = self
        tableDetails.dataSource = self
        
        fetchData()
    }
    
    func fetchData(){
        let urlString = URL(string: "https://dummyjson.com/products")
        guard urlString != nil else{
            printContent("JSONProducts")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: urlString!){ data, response, error in if error == nil && data != nil{
            let decoder = JSONDecoder()
            
            do{
                self.product = try decoder.decode(PhoneApi.self, from: data!)
            }catch{
                print("Error occured")
            }
            
            DispatchQueue.main.async {
                self.tableDetails.reloadData()
            }
        }
            
        }
        dataTask.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        product?.products.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableDetails.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
            cell.phoneTitle.text=product?.products[indexPath.row].title
            cell.phoneDesc.text=product?.products[indexPath.row].description
            let price = product?.products[indexPath.row].price
            cell.phonePrice.text="\(price!)"
            let urlimage=URL(string: (product?.products[indexPath.row].thumbnail)!)
            cell.phoneImg.imageIn(from: urlimage!)
            cell.phoneImg?.contentMode = .scaleToFill
            return cell
        }
    }
extension UIImageView{
    func imageIn(from url: URL){
        let dataTask = URLSession.shared.dataTask(with: url){
            data, response, error in print("data fetched")
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode==200,
                  let mimeType = response?.mimeType,mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self.image=image
            }
        }
        dataTask.resume()
    }
}
