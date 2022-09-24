//
//import UIKit
//
//class CityTableViewController: UITableViewDelegate, UITableViewDataSource {
//

//    struct City: Codable {
//            let city: String
//            let lat: Float
//            let lng: Float
//            let country: String
//        }
//    var cities: [City] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        addAlertController()
//
//        if let path = Bundle.main.path(forResource: "local.json", ofType: "json") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                guard let json = jsonResult as? Dictionary<String, AnyObject>, let dics = json["data"] else {
//                    return
//                }
//                let array = dics as! [Dictionary<String, AnyObject>]
//                for content in array {
//                    let city = content["city"] as! String
//                    let country = content["country"] as! String
//                    let lat = content["lat"] as! Float
//                    let lng = content["lng"] as! Float
//
//                    cities.append(City(city: city, lat: lat, lng: lng, country: country))
//                }
//            } catch {
//                print("error")
//            }
//    }
//        tableView = UITableView()
//
//        // set delegate
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        // set tableview size
//        tableView.frame = view.frame
//        // set tableview
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
//        view.addSubview(tableView)
//
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cities.count
//    }
//
//    // set tableview rows
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))! as UITableViewCell
//        cell.textLabel?.text = "\(cities[indexPath.row].city), \(cities[indexPath.row].country), \(cities[indexPath.row].lat), \(cities[indexPath.row].lng)"
//        return cell
//    }
//
//    // called when tableview cell was tapped
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath.row) cell was selected")
//    }

        
//        func addAlertController() {
//        let alertController = UIAlertController(title: "Add City", message: "", preferredStyle: .alert)
//         alertController.addTextField { (textField : UITextField!) -> Void in
//             textField.placeholder = "City Name"
//         }
//
//         let saveAction = UIAlertAction(title: "Add", style: .default, handler: { alert -> Void in
//             let firstTextField = alertController.textFields![0] as UITextField
//             print("City Name: \(firstTextField.text)")
//             let cityname = firstTextField.text
//            //guard let cityname = firstTextField.text else { return }
//             //loadData here
//
//                 //if(firstTextField.text == cityListObj.cities.getElementById("name").value){
//             })
//         let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action : UIAlertAction!) -> Void in
//            print("Cancel")
//         })
//
//         alertController.addAction(saveAction)
//         alertController.addAction(cancelAction)
//
//        self.present(alertController, animated: true, completion: nil)
//        }

            
//        func readLocalJSONFile(forName name: String) -> Data? {
//            do {
//                if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
//                    let fileUrl = URL(fileURLWithPath: filePath)
//                    let data = try Data(contentsOf: fileUrl)
//                    return data
//                }
//            } catch {
//                print("error: \(error)")
//            }
//            return nil
//        }
//
//        func parse(jsonData: Data) -> cityList? {
//            do {
//                let decodedData = try JSONDecoder().decode(cityList.self, from: jsonData)
//                return decodedData
//            } catch {
//                print("error: \(error)")
//            }
//            return nil
//        }
        
        
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//
//
//            let jsonData = readLocalJSONFile(forName: "local")
//            if let data = jsonData {
//            if let cityListObj = parse(jsonData: data) {
//                print("\(cityListObj.cities)")
//            }
//        }
//
//        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */




////
////  CityTableViewController.swift
////  WeatherApp
////
////  Created by Nguyễn Thị Vân Anh on 23/09/2022.
////
//
//import UIKit
//class CityTableViewController: UITableViewController {
//
//    var tableView: UITableView!
//
//    struct city: Codable {
//        let name: String
//        let country: String
//        let lat: Float
//        let lon: Float
//    }
//
//
//
//
//    func addAlertController() {
//    let alertController = UIAlertController(title: "Add City", message: "", preferredStyle: .alert)
//     alertController.addTextField { (textField : UITextField!) -> Void in
//         textField.placeholder = "City Name"
//     }
//
//     let saveAction = UIAlertAction(title: "Add", style: .default, handler: { alert -> Void in
//         let firstTextField = alertController.textFields![0] as UITextField
//         print("City Name: \(firstTextField.text)")
//         let cityname = firstTextField.text
//        //guard let cityname = firstTextField.text else { return }
//         //loadData here
//
//             //if(firstTextField.text == cityListObj.cities.getElementById("name").value){
//         })
//     let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action : UIAlertAction!) -> Void in
//        print("Cancel")
//     })
//
//     alertController.addAction(saveAction)
//     alertController.addAction(cancelAction)
//
//    self.present(alertController, animated: true, completion: nil)
//    }
//
//
//    func readLocalJSONFile(forName name: String) -> Data? {
//        do {
//            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
//                let fileUrl = URL(fileURLWithPath: filePath)
//                let data = try Data(contentsOf: fileUrl)
//                return data
//            }
//        } catch {
//            print("error: \(error)")
//        }
//        return nil
//    }
//
//    func parse(jsonData: Data) -> cityList? {
//        do {
//            let decodedData = try JSONDecoder().decode(cityList.self, from: jsonData)
//            return decodedData
//        } catch {
//            print("error: \(error)")
//        }
//        return nil
//    }
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        addAlertController()
//
//        let jsonData = readLocalJSONFile(forName: "local")
//        if let data = jsonData {
//        if let cityListObj = parse(jsonData: data) {
//            print("\(cityListObj.cities)")
//        }
//    }
//
//    }
//
//
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
//
//    }
//
//
//
