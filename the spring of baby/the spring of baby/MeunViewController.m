//
//  MeunViewController.m
//  Foodspotting
//
//  Created by jetson  on 12-8-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MeunViewController.h"
#import "RootViewController.h"
#import "DDMenuController.h"
#import "AppDelegate.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "FirstViewController.h"
@interface MeunViewController ()

@end

@implementation MeunViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	list = [[NSMutableArray alloc]init];
    [list addObject:@"首页"];
    [list addObject:@"图片"];
	[list addObject:@"视频"];
	[list addObject:@"音乐"];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#define macro ===========tableView============



//选中Cell响应事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	// set the root controller
    DDMenuController *menuController = (DDMenuController*)((AppDelegate *)[[UIApplication sharedApplication] delegate]).menuController;
	NSLog(@"------>%li",(long)indexPath.row);
	if(indexPath.row==0){
		RootViewController *viewController = [[RootViewController alloc]init];
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
		
		[menuController setRootController:navController animated:YES];
	}else if(indexPath.row ==1){
	    FirstViewController *controller = [[FirstViewController alloc] init];
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
		
		[menuController setRootController:navController animated:YES];
	
	}else if(indexPath.row ==2){
	    SecondViewController *controller = [[SecondViewController alloc] init];
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
		
		[menuController setRootController:navController animated:YES];
		
	}else{
		ThreeViewController *controller = [[ThreeViewController alloc] init];
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
		
		[menuController setRootController:navController animated:YES];
	
	}

//    controller.title = [NSString stringWithFormat:@"Cell %i", indexPath.row];
   
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	
    //    //点击完毕，立即恢复颜色
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; 
}

//改变行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
}
//返回TableView中有多少数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [list count];
    
}
//返回有多少个TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//组装每一条的数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CustomCellIdentifier =@"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    if (cell ==nil) {
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CustomCellIdentifier];
    }
	cell.textLabel.text = [list objectAtIndex:indexPath.row];
    return cell;
    
}
@end
