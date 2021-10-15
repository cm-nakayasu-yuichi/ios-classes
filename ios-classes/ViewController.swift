import UIKit

class ViewController: UIViewController {

    private typealias Section = (String, [Row])
    private typealias Row = (String, (UIViewController) -> ())
    
    private let sections: [Section] = [
        ("テスト", [
            ("テスト", { this in
                var o1 = [2, 1, 3, 4, 1, 5, 1, 1, 3, 0, 1]
                
                o1.move(from: 0, to: 2)
                print(o1)
            }),
        ]),
    ]
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        return section.1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = sections[indexPath.section].1[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "row", for: indexPath)
        cell.textLabel?.text = row.0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = sections[indexPath.section].1[indexPath.row]
        row.1(self)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].0
    }
}
