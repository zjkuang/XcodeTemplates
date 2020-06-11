//___FILEHEADER___

#import <UIKit/UIKit.h>

// How To Use
//   CAUTION!!! WHEN CREATING A CUSTOM VIEW, THERE SHALL BE NO SPACE
//   IN THE FILE NAME
//     e.g.
//       MyCustomView      - OK
//       My Custom View    - ERROR!!!
//   (1) Open your XIB file where you want to add a custom UIView
//   (2) Add a new UIView as the subview (and let's call it "c") to
//       any of your existing view
//   (3) Select the new added subview "c"
//   (4) From the Identity Inspector, change the Class of "c" to
//       CustomViewAndXIB
//   (5) Add whatever subviews into "c" and add corresponding layout
//       constraints as usual
//   (6) Control-drag and drop the subviews and/or layout constraints
//       into this file to create "@IBOutlet"s

@interface ___FILEBASENAMEASIDENTIFIER___ : UIView

@property (strong, nonatomic) IBOutlet UIView *view;

@end
