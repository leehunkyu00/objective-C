#import "Product.h"

@implementation Product
@synthesize productImage;
@synthesize productName,productPrice;

- (id)init {
    if(self = [super init]) {
        
    }
    return self;
}

+ (id) product:(NSString *)name price:(NSString *)price imageName:(NSString *)imageName {
    Product *p = [[[Product alloc] init] autorelease];
    
    p.productName = name;
    p.productPrice = price;
    p.productImage = [UIImage imageNamed:imageName]; 
    
    return p;
}

- (void)dealloc {
    [productImage release];
    [productName release];
    [productPrice release];
    
    [super dealloc];
}
@end
