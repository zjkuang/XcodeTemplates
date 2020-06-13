//___FILEHEADER___

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: UIViewController {
    
    @IBOutlet weak var baseView: UIView!
    
    private var viewModel = ___VARIABLE_productName:identifier___ViewModel()
    private var flag1Observation: NSKeyValueObservation? // KVO
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setKVO()
    }
    
    private func setKVO() {
        flag1Observation = viewModel.observe(\___VARIABLE_productName:identifier___ViewModel.observableFlag1, options: [.old, .new], changeHandler: { (viewModel, change) in
            print("*** flag1Observation: \((change.oldValue ?? false) ? "true" : "false") -> \((change.newValue ?? false) ? "true" : "false")")
            if change.newValue != change.oldValue {
                
            }
        })
    }

}
