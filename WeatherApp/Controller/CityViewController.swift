
import UIKit



struct City: Codable {
    let city: String
    let lat: String
    let lng: String
    let country: String
    let population: String
}


class CityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var cities: [City] = []
    
    var filteredData = [String]()
    var isSearching = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cities)
        print(cities[0].city)
        print("Hello")
        tableView.rowHeight = UITableView.automaticDimension
        
        let jsonData = readLocalJSONFile(forName: "local")
        

        if let data = jsonData {
                cities = parse(jsonData: data)
                tableView.reloadData()
        }

        searchBar.delegate = self
        searchBar.enablesReturnKeyAutomatically = false
        
        // set delegate
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // set tableview size
        tableView.frame = view.frame
        tableView.keyboardDismissMode = .onDrag
        // set tableview
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        self.view.addSubview(tableView)

    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredData.count
        } else {
            return cities.count
        }
    }
    
    // set tableview rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))! as UITableViewCell
        if isSearching {
            cell.textLabel?.text = filteredData[indexPath.row]
        } else {

            cell.textLabel?.text = """
                    \(cities[indexPath.row].city), \(cities[indexPath.row].country)
                    Latitude: \(cities[indexPath.row].lat), Longitude: \(cities[indexPath.row].lng)
                    Population: \(cities[indexPath.row].population)
                    """
        }

        cell.textLabel?.sizeToFit()
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // called when tableview cell was tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) cell was selected")
        
        
    }
}
    
extension CityViewController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchBar.text == "" {
                isSearching = false
                tableView.reloadData()
            } else {
                isSearching = true

//                filteredData = cities[IndexPath.row].city.filter({$0.contains(searchBar.text ?? "")})
                tableView.reloadData()
            }
        }
    }

extension CityViewController {
    func parse(jsonData: Data) -> [City] {
        do {
            let decodedData = try JSONDecoder().decode( [City].self, from: jsonData)
            self.cities = decodedData
//            print(decodedData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return []
    }
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
    


