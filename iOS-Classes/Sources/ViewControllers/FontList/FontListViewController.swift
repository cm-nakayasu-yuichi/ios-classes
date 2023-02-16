import UIKit

class FontListViewController: UIViewController {
    
    enum Row {
        case family(name: String)
        case font(name: String)
    }
    
    private var presenter: FontListPresenterProtocol!
    
    private var rows: [Row] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = FontListPresenter(view: self)
        presenter.didLoad()
    }
}

extension FontListViewController: FontListViewProtocol {
    
    func showList() {
        rows = presenter.fonts.reduce(into: [Row]()) { res, font in
            res.append(.family(name: font.familyName))
            res.append(contentsOf: font.fontNames.map { .font(name: $0) })
        }
    }
}

extension FontListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.fonts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.fonts[section].fontNames.count + 1 // +1 = family name cell in head.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = indexPath.row == 0 ? "family" : "font"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let family = presenter.fonts[indexPath.section].familyName
        let font = presenter.fonts[indexPath.section].fontNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
