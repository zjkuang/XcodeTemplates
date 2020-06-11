//___FILEHEADER___

import UIKit

// How To Use
//   (1) Open your XIB file where you want to add a custom UIView
//   (2) Add a new UIView as the subview (and let's call it "c") to
//       any of your existing view
//   (3) Select the new added subview "c"
//   (4) From the Identity Inspector, change the Class of "c" to
//       CustomViewAndXIB
//   (5) Add whatever subviews into "c" and add corresponding layout
//       constraints as usual
//   (6) Add subviews into virtualContentView and set layout
//       constraints
//   (7) Control-drag and drop the subviews and/or layout constraints
//       into this file to create "@IBOutlet"s

class ___FILEBASENAMEASIDENTIFIER___: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var virtualContentView: UIView!
    // Control-drag and drop the subviews and/or layout constraints to create "@IBOutlet"s
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    func customInit() {
        Bundle.main.loadNibNamed(myNibName(), owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        
        // Any other pre-settings, e.g.
        // self.scrollView.backgroundColor = .red
    }
    
    private func myNibName() -> String {
        var nibName = ""
        var file = URL(fileURLWithPath: #file).lastPathComponent
        if let range = file.range(of: ".swift", options: .backwards) {
            file.removeSubrange(range)
            nibName = file
        }
        return nibName
    }
    
}
