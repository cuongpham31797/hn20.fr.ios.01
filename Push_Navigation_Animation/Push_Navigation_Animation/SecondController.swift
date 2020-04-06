import UIKit

class SecondController: UIViewController {
    let triggerButton = UIButton()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemPink
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "<", style: .done, target: self, action: #selector(onTapBack))
    }
    
    @objc func onTapBack(){
        self.navigationController?.popViewController(animated: true)
    }
}

extension SecondController : CircleTransitionable {
    var mainView: UIView {
        return self.view
    }
}
