import UIKit

class BootstrapViewController: UIViewController {

    private typealias Section = (String, [Row])
    private typealias Row = (String, (UIViewController) -> ())
    
    private let sections: [Section] = [
        ("画面動作確認", [
            ("フォント一覧", { this in
                let vc = FontListViewController.instantiate().withinNavigation()
                AppDelegate.shared.change(to: vc)
            }),
        ]),
        ("テスト", [
            ("テスト", { this in
                var o = [0,1,4,6,8,1,0,4,6,3,2,8,0,3,2,0,0,4]
                (0...o.count + 5).forEach { i in
                    print(o[safe: i])
                }
            }),
        ]),
    ]
}

extension BootstrapViewController: UITableViewDelegate, UITableViewDataSource {
    
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
