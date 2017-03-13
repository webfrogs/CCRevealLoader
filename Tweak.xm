#include <dlfcn.h>

%ctor {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.nswebfrog.revealloader.plist"] ;
    NSString *libraryPath = @"/Library/Application Support/CCRevealLoader/RevealServer.framework/RevealServer";

    NSString *keyPath = [NSString stringWithFormat:@"CCRevealEnabled-%@", [[NSBundle mainBundle] bundleIdentifier]];
    NSLog(@"CCRevealLoader before loaded %@,keyPath = %@,prefs = %@", libraryPath,keyPath,prefs);
    if ([[prefs objectForKey:keyPath] boolValue]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:libraryPath]){
            void *haldel = dlopen([libraryPath UTF8String], RTLD_NOW);
        if (haldel == NULL) {
            char *error = dlerror();
            NSLog(@"dlopen error: %s", error);
        } else {
            NSLog(@"dlopen load framework success.");
			[[NSNotificationCenter defaultCenter] postNotificationName:@"CCRevealLoaderRequestStart" object:nil];
        }

        NSLog(@"CCRevealLoader loaded %@", libraryPath);
        } else {
            NSLog(@"CCRevealLoader file not exists %@", libraryPath);
        }
    }
    else {
        NSLog(@"CCRevealLoader not enabled %@", libraryPath);
    }

    NSLog(@"CCRevealLoader after loaded %@", libraryPath);


    [pool drain];
}