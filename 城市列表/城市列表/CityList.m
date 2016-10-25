//
//  CityList.m
//  PCN
//
//  Created by 蒙奇D路飞 on 16/8/2.
//  Copyright © 2016年 com.smh.pcn. All rights reserved.
//

#import "CityList.h"
#import "CityCollectionCell.h"
#import "CityCollectionHeadView.h"
#import "ZYPinYinSearch.h"
#import <CoreLocation/CoreLocation.h>
#import "CommonDefine.h"
#import "MBProgressHUD.h"
@interface CityList ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CLLocationManagerDelegate>{
    
    NSMutableArray *allCities;
    NSMutableArray *allCityNames;
    NSArray *hostCities;
    NSString *currentLocationCityName;
    BOOL isLocationFail;
    BOOL isLocating;
}
@property (nonatomic,strong) UITableView *mainTable;
@property (assign, nonatomic) BOOL isSearch;
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) NSArray *data;
@property (nonatomic,strong) NSMutableArray *searchData;
@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) CLLocationManager *locManager;//获取用户位置
@property(nonatomic,strong) CLGeocoder *geocoder;//反地理编码

@end

@implementation CityList

static NSString *collectionCellID = @"collectionCellID";
static NSString *collectionHeadID = @"collectionHeadID";

-(CLLocationManager *)locManager{
    if (!_locManager) {
        _locManager = [CLLocationManager new];
        if (IOS_7) {
            [_locManager startUpdatingLocation];
        }else{
            
            [_locManager requestAlwaysAuthorization];
        }
        _locManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locManager.distanceFilter = kCLDistanceFilterNone;
    }
    return _locManager;
}
-(CLGeocoder *)geocoder{
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc]init];
    }
    return _geocoder;
}
-(NSArray *)data{
    if (!_data) {
        _data = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"cityGroups" ofType:@"plist"]];
    }
    return _data;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth- 20, (hostCities.count/3==0?hostCities.count/3:hostCities.count/3+1)*40 + 40 + 60) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加城市";
    self.view.backgroundColor = UIColorFromRGBA(0xe2e6ed, 1);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    allCities = [NSMutableArray new];
    hostCities = [NSArray new];
    allCityNames = [NSMutableArray new];
    isLocating = NO;
    for (NSDictionary *dic in self.data) {
        if (![dic[@"title"] isEqualToString:@"热门"]) {
            for (NSString *cityName in dic[@"cities"]) {
                [allCityNames addObject:cityName];
            }
            [allCities addObject:dic];
        }else{
            hostCities = dic[@"cities"];
        }
    }
    [self.collectionView registerClass:[CityCollectionCell class] forCellWithReuseIdentifier:collectionCellID];
    [self.collectionView registerClass:[CityCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeadID];
    
    self.mainTable.sectionIndexBackgroundColor = [UIColor clearColor];
    self.searchData = [NSMutableArray new];
    //设置搜索框
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"请输入城市名称或首字母查询";
    self.searchBar.searchBarStyle = UISearchBarStyleProminent;
    self.mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, ScreenWidth, ScreenHeight - 40 -64)];
    self.mainTable.delegate = self;
    self.mainTable.dataSource = self;
    self.mainTable.tableFooterView = [UIView new];
    
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.mainTable];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(returnVC)];
//    [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"return"] style:UIBarButtonItemStyleDone target:self action:];
    [self statLocation];
}
-(void)statLocation{
    //开始定位，定位后签到
    self.locManager.delegate = self;
    if (IOS_8) {
        
        [self.locManager requestWhenInUseAuthorization];
        
    }
    // 设置定位精度，十米，百米，最好
    [self.locManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    [self.locManager startUpdatingLocation];
    
    [self.geocoder reverseGeocodeLocation:self.locManager.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        [self.locManager stopUpdatingLocation];
        isLocating = YES;
        if (error || placemarks.count == 0) {
            isLocationFail = YES;
        }else{
            isLocationFail = NO;
            CLPlacemark *currentPlace = [placemarks firstObject];
            currentLocationCityName = currentPlace.locality;
        }
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reloadCollection) userInfo:nil repeats:NO];
    }];
}
-(void)reloadCollection{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.collectionView reloadItemsAtIndexPaths:@[path]];
    });
}
-(void)returnVC{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UISearchBarDelegate
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self.searchData removeAllObjects];
    NSArray *ary = [NSArray new];
    ary = [ZYPinYinSearch searchWithOriginalArray:allCityNames andSearchText:searchText andSearchByPropertyName:@"cities"];
    if (searchText.length == 0) {
        [self.searchData addObjectsFromArray:allCityNames];
        _isSearch = NO;
    }else {
        [self.searchData addObjectsFromArray:ary];
        _isSearch = YES;
    }
    [self.mainTable reloadData];
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    _searchBar.showsCancelButton = YES;
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    _searchBar.showsCancelButton = NO;
    [_searchBar resignFirstResponder];
    _searchBar.text = @"";
    _isSearch = NO;
    [_mainTable reloadData];
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (!_isSearch) {
        return allCities.count + 1;
    }else{
        return 1;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!_isSearch) {
        if (section == 0) {
            return 1;
        }else{
            NSArray *cities = allCities[section - 1][@"cities"];
            return cities.count;
        }
    }else {
        return self.searchData.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!_isSearch) {
        if (indexPath.section == 0) {
            return (hostCities.count/3==0?hostCities.count/3:hostCities.count/3+1)*40 + 40 + 60;
        }else{
            return 44;
        }
    }else{
        return 44;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if (!_isSearch) {
        if (indexPath.section == 0 && indexPath.row == 0) {
            UITableViewCell *newCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"new"];
            [newCell addSubview:self.collectionView];
            return newCell;
        }else{
            NSDictionary *dic = allCities[indexPath.section - 1];
            cell.textLabel.text = dic[@"cities"][indexPath.row];
        }
    }else{
        cell.textLabel.text = self.searchData[indexPath.row];
    }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cityName = [NSString new];
    if (!_isSearch) {
        if (indexPath.section !=0) {
            NSDictionary *dic = allCities[indexPath.section - 1];
            cityName = dic[@"cities"][indexPath.row];
        }
    }else{
        cityName = self.searchData[indexPath.row];
    }
    self.selectCity(cityName);
    
    [self returnVC];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (!_isSearch) {
        if (section == 0) {
            return nil;
        }else{
            return allCities[section - 1][@"title"];
        }
    }else {
        return nil;
    }
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    if (!_isSearch) {
        NSMutableArray *arr = [NSMutableArray new];
        for (NSDictionary *dic in allCities) {
            [arr addObject:dic[@"title"]];
        }
        return arr;
    }else {
        return nil;
    }
}
#pragma mark 索引列点击事件
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    //点击索引，列表跳转到对应索引的行
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index+1] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    [self showMessage:title toView:self.view];
    return index+1;
}

#pragma mark - UICollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return hostCities.count;
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CityCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    if (!cell) {
        cell = [[CityCollectionCell alloc]initWithFrame:CGRectZero];
    }
    if (indexPath.section == 0) {
        cell.titleLabel.text = @"定位中...";
        cell.titleLabel.textAlignment = NSTextAlignmentLeft;
        CGRectSetX(cell.titleLabel.frame, cell.gpsImageView.frame.size.width +cell.gpsImageView.frame.origin.x+5);
        [cell.gpsImageView startAnimating];
        if (isLocating) {
            
            [cell isShowGPSStatus:isLocationFail withLocationCityName:currentLocationCityName];
        }
        
    }else{
        cell.titleLabel.text = hostCities[indexPath.row];
    }
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && !isLocationFail) {
        self.selectCity(currentLocationCityName);
    }else{
        self.selectCity(hostCities[indexPath.row]);
    }
    [self returnVC];
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    NSString *reuseIdentifier;
    if ([kind isEqualToString: UICollectionElementKindSectionHeader ]){
        reuseIdentifier = collectionHeadID;
    }
    
    CityCollectionHeadView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        if (indexPath.section == 0) {
            view.sectionTitleLabel.text = @"定位城市";
        }else{
            view.sectionTitleLabel.text = @"热门城市";
        }
    }
    
    return view;
}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(ScreenWidth, 30);
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(self.collectionView.frame.size.width/3, 30);
    }else{
        return CGSizeMake(self.collectionView.frame.size.width/3 - 20, 30);
    }
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    UICollectionViewFlowLayout *flowLayout =
    (UICollectionViewFlowLayout *)collectionViewLayout;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 5;
    return UIEdgeInsetsMake(5, 10, 5, 10);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 显示一些信息
- (void)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:0.7];
}
@end
