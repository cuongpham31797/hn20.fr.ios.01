import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var languagePicker: UIPickerView!
    @IBOutlet weak var translateButton: UIButton!
    var index : Int?
    let languageArray : [String] = ["English", "Vietnamese", "France", "Japanese", "Korea", "Chinese", "Germany", "Italy", "Spain", "Portugal", "Nertherland", "Russia", "Laos", "Poland"]
    let meaningArray : [String] = ["Hello world", "Xin chào thế giới", "Bonjour le monde", "んにちは世界", "안녕 세상", "你好，世界", "Hallo Welt", "Ciao mondo", "Hola Mundo", "Olá Mundo", "Hallo Wereld", "Привет, мир", "ສະ​ບາຍ​ດີ​ຊາວ​ໂລກ","Witaj świecie",]
    
    @IBAction func onTapTranslate(_ sender: UIButton) {
        guard let _index = index else {
            return
        }
        mainLabel.text = meaningArray[_index]
    }
}

extension ViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        translateButton.layer.cornerRadius = 15
        languagePicker.delegate = self
        languagePicker.dataSource = self
        if index == nil {
            mainLabel.text = meaningArray[0]
        }
    }
}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languageArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languageArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.index = row
    }
}
