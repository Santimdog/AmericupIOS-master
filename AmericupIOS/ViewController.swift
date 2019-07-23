import Foundation
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scanTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Prepare the navigation to BarcodeViewController scene
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get a reference of BarcodeViewController from the Navigation Controller stack
        if let navigationController = segue.destination as? UINavigationController,
            let barcodeViewController = navigationController.topViewController as? BarcodeViewController {
            //Confirm the BookViewController as delegate of BarcodeViewController
            barcodeViewController.delegate = self
        }
    }
    
}
extension ViewController:BarcodeViewControllerDelegate {
    func foundBarcode(barcode:String) {
        //When the barcode is received, the ISBN field is updated
        scanTextField.text = barcode
    }
}
