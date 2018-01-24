#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic, retain) UIImage *productImage;
@property (retain) NSString *productName;
@property (retain) NSString *productPrice;

+ (id) product:(NSString *)name price:(NSString *)price imageName:(NSString *)imageName;

@end
