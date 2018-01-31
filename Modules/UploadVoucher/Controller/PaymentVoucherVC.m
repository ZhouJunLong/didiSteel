//
//  PaymentVoucherVC.m
//  DiDiSteel
//
//  Created by demo.zheng on 16/6/15.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "PaymentVoucherVC.h"

// view And Cell
#import "VoucherHeaderView.h"
#import "VoucherFooterView.h"
#import "VoucherMoneyTVCell.h"
#import "VoucherTextFieldCell.h"

// api 假接口测试用的
#import "UploadTool.h"

@interface PaymentVoucherVC () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) BaseTableView *tableView;

@property (nonatomic, strong) VoucherHeaderView *headerView;

@property (nonatomic, strong) VoucherFooterView *footerView;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIImagePickerController *imagePicker;

@property (nonatomic, strong) UIImage *orgImage;

@end

@implementation PaymentVoucherVC

+ (void)load
{
    [ODYRouter registerClass:self key:@"paymentVoucher"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = YES;
    [self setNaviTitle:@"上传付款凭证"];

    [self layoutUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)]];
}

- (void)layoutUI
{
    self.tableView = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.widthNormal, self.view.heightNormal) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 44;
    [self.view addSubview:self.tableView];
}

- (UIView *)creatHeaderView
{
    self.headerView = [[VoucherHeaderView alloc] initWithFrame:CGRectZero];
    self.headerView.backgroundColor = [UIColor whiteColor];
    Strong2Weak;
    self.headerView.imgButtonBlock = ^() {
        [weakSelf.textField resignFirstResponder];
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:weakSelf cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"打开相册", nil];
        [sheet showInView:weakSelf.view];
    };

    // 样本
    self.headerView.sampleBlock = ^() {

    };

    return self.headerView;
}

- (UIView *)creatFooterView
{
    self.footerView = [[VoucherFooterView alloc] initWithFrame:CGRectZero];
    Strong2Weak;
    self.footerView.confirmsBlock = ^() {
        // 这里上传凭证之前要先去调上传图片的公共接口
        if (weakSelf.orgImage == nil )
        {
            [self showError:@"请选择凭证并上传"];
            return;
        }
        NSUInteger numberKB = [[weakSelf getImageData] length] / 1024;
        if (numberKB > 500)
        {
            [self showError:@"选择的图片超过了500KB"];
            return;
        }
        
        [UploadTool saveOrder:[weakSelf getImageData] companyId:@"1" orderCode:@"1" orderAmount:weakSelf.textField.text viewController:weakSelf];
        
    };
    return self.footerView;
}

- (void)hideKeyboard
{
    [self.view endEditing:YES];
}

- (NSData *)getImageData
{
    return UIImageJPEGRepresentation(self.orgImage, 0.5);
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        VoucherMoneyTVCell *cell = [VoucherMoneyTVCell cellForTableView:tableView];
        return cell;
    }
    else if (indexPath.row == 1)
    {
        VoucherTextFieldCell *cell = [VoucherTextFieldCell cellForTableView:tableView];
        self.textField = cell.textField;
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 120;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 140;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self creatHeaderView];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [self creatFooterView];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField;
{
    [self.textField resignFirstResponder];
}

#pragma mark - 处理分割线从左端顶头开始
/**
 *  将 tableView 的分割线从左端顶头开始
 */
- (void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;

            if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront])
            {
                _imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            }

            self.imagePicker.mediaTypes = @[ (NSString *)kUTTypeImage ];

            [self presentViewController:self.imagePicker animated:YES completion:NULL];
        }
        else
        {
            return;
        }
    }
    else if (buttonIndex == 1)
    {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.imagePicker.mediaTypes = @[ (NSString *)kUTTypeImage ];
        [self presentViewController:self.imagePicker animated:YES completion:NULL];
    }
}

- (UIImagePickerController *)imagePicker
{
    if (_imagePicker == nil)
    {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.modalPresentationStyle = UIModalPresentationOverFullScreen;
        _imagePicker.allowsEditing = YES;
        _imagePicker.delegate = self;
    }
    return _imagePicker;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.orgImage = info[UIImagePickerControllerOriginalImage];
    [self.headerView.selectedImgButton setTitle:@"" forState:UIControlStateNormal];
    [self.headerView.selectedImgButton setBackgroundImage:self.orgImage forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
}

@end
