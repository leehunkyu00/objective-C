// FeedLoader.m
// ios network book 53p

- (void) doQueueRequest:(NSString *)urlString delegate:(id)delegate {
    // create NSURL instance
    NSURL *url = [NSURL URLWithString:urlString];

    // no using cache, setting time out for 30 second
    NSURLRequest *request = [NSURLRequset requestWithURL:url
        cachePolicy:NSURLRequestReloadIgnoreingLocalAndRemoteCacheData
    timeoutInterval:30.0];

    // if not exist queue, create queue
    if (queue == nil) {
        queue = [ [NSOperationQueue alloc] init];
    }

    // send request, running handler getting response
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *response,
                                   NSData *data,
                                   NSError *error) {
                               if (error != nil) {
                                   NSLog(@"Error on load = $@", [error localizedDescription);
                               } else {
                                   // check HTTP status
                                   if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                       NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                       if (httpResponse.statusCode != 200) {
                                           return;
                                       }
                                   }

                                   // parshing result and create dictionary
                                   NSDictionary *dictionary =
                                       [XMLReader dictionaryForXMLData:data
                                                                 error:&error];
                                   NSLog(@"feed = %@", dictionary);

                                   NSArray *entries = [self getEntriesArray:dictinoary];

                                   // getting dictionary list
                                   NSArray *entries = [self getEntriesArray:dictionary];

                                   // call delegate
                                   if ([delegate respondsToSelector:@selector(setVideos:)]) {
                                      [delegate performSelectorOnMainThread:@selector(setVideos:)
                                                                widthObject:entries
                                                              waitUntilDone:YES];
                                   }

                               }
                           }];
}
