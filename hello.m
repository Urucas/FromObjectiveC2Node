#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

int main() {
	@autoreleasepool {
		
    NSArray *args = [[NSProcessInfo processInfo] arguments];
		
    if(args.count > 1) {
      NSString *arg = @"Hello ";
      arg = [arg stringByAppendingString:[args objectAtIndex:1]];
      arg = [arg stringByAppendingString:@"!"];
      puts((char*)[arg UTF8String]);
    }else {
      puts("Hello World!");
    }
  }
	return 0;
}
