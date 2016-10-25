

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
//    NSString *souchPath=[[NSBundle mainBundle] pathForResource:@"database" ofType:@"sqlite"];//获取database.sqlite的资源路径
//    NSString *designPath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/myMenu.sqlite3"];//自己的沙盒路径
//    NSFileManager *flie=[NSFileManager defaultManager];//创建资源管理类对象
//    if (![flie fileExistsAtPath:designPath])//判读路径文件是否存在
//    {
//        [flie copyItemAtPath:souchPath toPath:designPath error:nil];//从目标资源路径COPY资源数据到指定路径
//    }
//    
    ViewController *login=[[ViewController alloc]init];
    self.window.rootViewController=login;
    
    
    
    
    
//    self.window = [UIWindow new];
//    self.window.rootViewController = [[UIViewController alloc] init];
//    
//    // Real Size
//    CGRect frame = [UIScreen mainScreen].bounds;
//    
//    // Real Size + 0.000001
//    self.window.frame = CGRectMake(0, 0, frame.size.width+0.000001, frame.size.height+0.000001);
//    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
