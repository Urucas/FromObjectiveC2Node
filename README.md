# FromObjectiveC2Node

A simple "Hello World!" built on Objective-C & executed with node.js

# Usage
```bash
git clone https://github.com/Urucas/FromObjectiveC2Node.git && cd FromObjectiveC2Node
clang -fobjc-arc -framework Foundation hello.m -o hello.o
node index.js
```

#How it works?
The process to export a simple Hello World! built on objective-c to node.js it's quite easy.

As a first step let's create an objective-c file to "Hello World!" you;
```c++
// hello.m file
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
```

Now, we'll compile the ```hello.m``` source with ```clang``` to create an executable file;
```bash
clang -fobjc-arc -framework Foundation hello.m -o hello.o
```


Once you have the compiled ```hello.o```, we can execute this from node.js 
Let's create a module for this;
```javascript
// hello.js
'use strict';

module.exports = function(param) {
  var execFile = require('child_process').execFile;
  var args = param == undefined ? [] : [param];
  execFile('./hello.o', args, {cwd: __dirname}, function(err, stdout) {
    if(err) console.log(err);
    console.log(stdout.trim());
  });  
}
```

Great, now we can include this module in our code;
```javascript
var hello = require('./hello');
hello();
// output: Hello World!

hello("bruno");
// output: Hello bruno!
```
Voila!


# Projects
* [@sindresorhus](https://github.com/sindresorhus) [node-osx-wallpapers](node-osx-wallpaper), [osx-wallpapers](https://github.com/sindresorhus/osx-wallpaper). A project to set & get the osx desktop wallpaper via Objective-c & node.js
