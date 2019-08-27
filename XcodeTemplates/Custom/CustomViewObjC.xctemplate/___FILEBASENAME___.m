//___FILEHEADER___

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
//       into the .h file to create "@IBOutlet"s

#import "___FILEBASENAMEASIDENTIFIER___.h"

@implementation ___FILEBASENAMEASIDENTIFIER___

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self customInit];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self customInit];
    return self;
}

- (void)customInit {
    [[NSBundle mainBundle] loadNibNamed:@"___FILEBASENAMEASIDENTIFIER___" owner:self options:nil];
    [self addSubview:self.view];
    [self.view setFrame:self.bounds];
    
    // Any other pre-settings, e.g.
    // self.view.backgroundColor = [UIColor redColor];
}

@end
