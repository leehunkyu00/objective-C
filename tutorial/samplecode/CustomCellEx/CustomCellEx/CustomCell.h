#import <UIKit/UIKit.h>

@class Product;
@interface CustomCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UIImageView *productImage;
@property (retain, nonatomic) IBOutlet UILabel *productName;
@property (retain, nonatomic) IBOutlet UILabel *productPrice;

- (IBAction)addCart:(id)sender;
- (void) setProduct:(Product *)product;
@end
