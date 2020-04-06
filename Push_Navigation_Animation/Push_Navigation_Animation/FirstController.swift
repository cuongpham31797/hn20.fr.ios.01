import UIKit

class FirstController: UIViewController {
    let triggerButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        triggerButton.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
        self.view.addSubview(triggerButton)
        triggerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                       triggerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/5).isActive = true
               triggerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                       triggerButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    @objc func buttonWasTapped() {
        let vc = SecondController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension FirstController : CircleTransitionable {
    var mainView: UIView {
        return self.view
    }
}
