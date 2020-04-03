import UIKit

class ViewController: UIViewController {
    var test : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onTapCrash(_ sender: UIButton) {
        fatalError("App Crash")
       // print(test!)
    }
}
