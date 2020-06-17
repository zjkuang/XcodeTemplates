# XcodeTemplates
Custom templates for Xcode
<pre>
This custom template pack includes
 - Custom UIView+XIB, in both Swift and Objective C
 - Custom UIScrollView+XIB, in both Swift and Objective C
 - Custom SwiftUI View+ViewModel in SwiftUI
 - Generic Navigation List in SwiftUI
 - SwiftUIVVM
 - SwiftVVM
</pre>
# How to install
<pre>
(1) Clone this repository to your local directory
    In Terminal, type
    "git clone git@github.com:zjkuang/XcodeTemplates /path/to/local/repository/XcodeTemplates"
(2) Install the templates
    In Terminal, type
    "/path/to/local/repository/XcodeTemplates/XcodeTemplates/install.sh"
    (No mystery here at all. It simply copies the templates to the place where Xcode can be
    aware of.)
</pre>
# Generic Navigation List
* Background
<pre>
Creating a Settings-like list view in SwiftUI also demands a lot of tricks.
The template in this repo helps generate a generic list view+viewModel.
Starting from this sample can make your job much easier.
</pre>
* How To Use

![](https://github.com/zjkuang/XcodeTemplates/blob/master/GenericNavigationListTemplateDemo.gif)
<pre>
Note:
In your project, the contents generated in xxxSharing.swift and xxxUISharing.swift shall be
moved to a common place to be shared globally in the app.
</pre>
# SwiftVVM
* Background
<pre>
When applying MVVM in your project, keep it consistent in style among all the View/ViewModel. This template provides a pack of ViewController/XIB/ViewModel, with KVO data binding inside, as a starting point for your new created views.
</pre>
* How To Use
New a file, (or by shortcut ⌘+N), scroll down to JKCS section, choose "SwiftVVM".

![](https://github.com/zjkuang/XcodeTemplates/blob/master/SwiftVVM.png)
# CustomViewSwift (and CustomViewObjC for Objective-C)
* Background
<pre>
When creating a custom view, we have to create from two system templates:
  - UIView
    (Under "Source" and choose "Cocoa Touch Class" and we can't create XIB file here.
    This will create the .swift or .h + .m)
  - View
    (Under "User Interface".
    This will create the .xib)
Then we need to hook them up manually with many steps which can be error-prone.

With the template in this repository, we can get the whole combo with a ⌘-N.
</pre>
* How To Use
<pre>
  (1) In Xcode's main menu, File/New/File (or ⌘-N) to add new file(s)
  (2) In the popup window, select iOS and scroll down to find the new added templates
</pre>
![](https://github.com/zjkuang/XcodeTemplates/blob/master/CustomTemplates.png)
<pre>
  (3) Choose CustomViewSwift (or CustomViewObjC depending on which language you are using) and
      click Next
  (4) Name the new custom view you are creating, e.g. MyCustomView.
      AVOID SPACE IN THE NAME. (e.g. "My Custom View" is bad.)
  (5) Now you will have the new files created and added into your project:
        MyCustomView.swift (or MyCustomView.h and MyCustomView.m in Objective-C)
        MyCustomView.xib
  (6) Open MyCustomView.xib, add subviews under the view and apply layout constraints to them.
  (7) Control-drag any subviews and/or layout constraints from MyCustomView.xib and drop into
      MyCustomView.swift (or MyCustomView.h) to create "@IBOutlet"s
  (8) In any view which needs to use MyCustomView as subview, first add a normal UIView as its
      subview
  (9) In "Identity Inspector", change the class of the new added UIView to MyCustomView (and
      let's call it myCustomView)
</pre>
![](https://github.com/zjkuang/XcodeTemplates/blob/master/IdentityInspector.png)
<pre>
  (10) Add layout constraints for myCustomView in its superview
  (11) Control-drag the myCustomView and drop it to where you need the @IBOutlet
</pre>
# AutoLayoutScrollViewSwift (and AutoLayoutScrollViewObjC for Objective-C)
* Background
<pre>
To arrange the auto-layout constraints for UIScrollView is also a little tricky. We need some
pre-process explained by
</pre>
[How to configure a UIScrollView with Auto Layout in Interface Builder](https://medium.com/@pradeep_chauhan/how-to-configure-a-uiscrollview-with-auto-layout-in-interface-builder-218dcb4022d7)
<pre>
And now again, with a ⌘-N, we can enjoy the ready-to-go AutoLayoutScrollView provided by
the template in this repository.
</pre>
* How To Use
<pre>
Quite similar to the usage of CustomViewSwift (or CustomViewObjC).
Make sure the subviews for the autoLayoutScrollView shall be added under virtualContentView.
</pre>
# Acknowledgement
These templates are inspired by [How to create a custom Xcode template for coordinators](https://www.hackingwithswift.com/articles/158/how-to-create-a-custom-xcode-template-for-coordinators)
