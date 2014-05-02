//
//  ControlVC.m
//
//
//  Created by Derek Weber on 5/2/14.
//
//

#import "ControlVC.h"

@interface ControlVC ()

@end

@implementation ControlVC

{
    UIView * controlsView;
    UIButton * filterButton;
    UIButton * hsbButton;
    UIButton * blurButton;
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
    {
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        if (self) {
            
        }
        return self;
    }
    
    - (void)viewDidLoad
    {
        [super viewDidLoad];
        
        
        controlsView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 140, SCREEN_WIDTH, 40)];
       
        [self.view addSubview:controlsView];
        
        
        
        
        filterButton = [[UIButton alloc] initWithFrame:CGRectMake(38, 5, 30, 30)];
        filterButton.backgroundColor = [UIColor whiteColor];
        [filterButton addTarget:self action:@selector(selectFilter) forControlEvents:UIControlEventTouchUpInside];
        [filterButton setImage:[UIImage imageNamed:@"filter"] forState:UIControlStateNormal];
//        [filterButton addObject:filterButton];
        [filterButton addSubview: controlsView];
        
                                                                  
        hsbButton = [[UIButton alloc] initWithFrame:CGRectMake(145, 5, 30, 30)];
        hsbButton.backgroundColor = [UIColor whiteColor];
        [hsbButton addTarget:self action:@selector(selecthsb) forControlEvents:UIControlEventTouchUpInside];
        [hsbButton setImage:[UIImage imageNamed:@"hsb"] forState:UIControlStateNormal];
//        [hsbButton addObject:hsbButton];
        [hsbButton addSubview: controlsView];
        
        blurButton = [[UIButton alloc] initWithFrame:CGRectMake(252, 5, 30, 30)];
        blurButton.backgroundColor = [UIColor whiteColor];
        [blurButton addTarget:self action:@selector(selectBlur) forControlEvents:UIControlEventTouchUpInside];
        [blurButton setImage:[UIImage imageNamed:@"blur"] forState:UIControlStateNormal];
//        [blurButton addObject:blurButton];
        [blurButton addSubview: controlsView];
        
}
    
-(void)selectFilter
    {
//        [self.delegate ControlVC];
        
    }
-(void)selecthsb
    {
//        [self.delegate selecthsb];
    }
    
-(void)selectBlur
    {
//        [self. delegate selectBlur];
    }

- (void)didReceiveMemoryWarning
        {
            [super didReceiveMemoryWarning];
            // Dispose of any resources that can be recreated.
        }
                                                                                                                         
        /*
         #pragma mark - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
         {
         // Get the new view controller using [segue destinationViewController].
         // Pass the selected object to the new view controller.
         }
         */
                                                                                                                         
@end
