//___FILEHEADER___

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: UIViewController {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = ___VARIABLE_productName:identifier___ViewModel()
    private var flag1Observation: NSKeyValueObservation? // KVO
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setKVO()
        tableView.register(UINib(nibName: ___VARIABLE_productName:identifier___TableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ___VARIABLE_productName:identifier___TableViewCell.reuseId)
    }
    
    private func setKVO() {
        flag1Observation = viewModel.observe(\___VARIABLE_productName:identifier___ViewModel.observableFlag1, options: [.old, .new], changeHandler: { (viewModel, change) in
            print("*** flag1Observation: \((change.oldValue ?? false) ? "true" : "false") -> \((change.newValue ?? false) ? "true" : "false")")
            if change.newValue != change.oldValue {
                
            }
        })
    }

}

extension ___FILEBASENAMEASIDENTIFIER___: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ___VARIABLE_productName:identifier___TableViewCell.reuseId) as? ___VARIABLE_productName:identifier___TableViewCell {
            cell.customTitleLabel.text = "\(indexPath)"
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
}
