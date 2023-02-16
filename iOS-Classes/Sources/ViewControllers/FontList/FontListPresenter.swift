import Foundation
import UIKit

protocol FontListPresenterProtocol: AnyObject {
    typealias Font = (familyName: String, fontNames: [String])
    
    var fonts: [Font] { get }
    
    func didLoad()
}

protocol FontListViewProtocol: AnyObject {
    func showList()
}

class FontListPresenter {
    
    weak var view: FontListViewProtocol!
    
    private(set) var fonts: [Font] = []
    
    init(view: FontListViewProtocol) {
        self.view = view
    }
}

extension FontListPresenter: FontListPresenterProtocol {
    
    func didLoad() {
        fonts = UIFont.familyNames.map { familyName in
            (familyName: familyName, fontNames: UIFont.fontNames(forFamilyName: familyName))
        }
        view.showList()
    }
}
