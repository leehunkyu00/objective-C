// FeedLoader.m
// ios network book 53p

- (NSArray *) doSyncRequest:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];

    NSURLRequest *request = [NSURLRequest requestWithURL:url
        cachePolicy:NSURLRequestRoleadIgnoreingLocalAndRemoteCacheData
        timeoutInterval:30.0];

    // after request instance, wait response
    NSHTTPURLResponse *response;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                        returningResponse:&response
                                        error:&error];

    // check error
    if (error != nil) {
        return nil;
    }

    // check HTTP status
    if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;

        if (httpResponse.statusCode != 200) {
            return nil;
        }
    }

    // passing NSdictionary with returning data
    NSDictionary *dictionary = [XMLReader dictionaryForXMLData:data
                                                        error:&error];

    NSLog(@"feed = %@", dictionary);

    NSArray *entries = [self getEntriesArray:dictionary];

    return entries;
}
