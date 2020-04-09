
import UIKit

class CalculatorViewController: UIViewController {


    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip: Float?
    var people: Float?
    var result: Float?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false

        sender.isSelected = true
        
        switch sender.currentTitle {
        case "0%":
            tip = 0
        case "10%":
            tip = 0.1
        default:
            tip = 0.2
        }
        
        billTextField.endEditing(true)
        
        
//        print(Float(sender.currentTitle!))
//        let percent = String(format: "%.1f", sender.currentTitle ?? "Error")
//        print(percent)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        people = Float(sender.value)
//        print(people ?? 0)
//        print(sender.value)
        splitNumberLabel.text = String(format: "%.f", people ?? 0)
//        people = Float(splitNumberLabel.text ?? "0")
//        print(people
//        )
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(billTextField.text ?? "0") ?? 0
        result = (bill + bill*(tip ?? 0) ) / (people ?? 0)
        print(result ?? 0)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.resultTitle = String(format: "%.2f", result ?? 0)
            destinationVC.text = "Split between \(Int(people ?? 0) ?? 0) people, with \(Int((tip ?? 0)*100))% tip."
        }
    }
}

