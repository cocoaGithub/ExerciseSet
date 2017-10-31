### 记录tableView cell当前滚动到的位置,下次进入直接跳转到上次浏览到的cell的位置 

实现UIScrollViewDelegate，并在拖动结束和滑动结束的代理方法中记录当前停止的位置

```
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.offset = scrollView.contentOffset;
    NSLog(@"table DidEndDecelerating");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    self.offset = scrollView.contentOffset;
    NSLog(@"table DidEndDragging");
}
```

### 在列表刷新数据后滚动到之前记录的位置

如果在reloadData后需要立即获取tableview的cell、高度，或者需要滚动tableview，那么，直接在reloadData后执行代码是有可能出问题的。

reloadDate并不会等待tableview更新结束后才返回，而是立即返回，然后去计算表高度，获取cell等。

如果表中的数据非常大，在一个run loop周期没执行完，这时，需要tableview视图数据的操作就会出问题了。

apple并没有直接提供reloadData的api，想要程序延迟到reloadData结束在操作，可以用以下方法:

方法一：

```
[self.tableView reloadData];
[self.tableView layoutIfNeeded];
//刷新完成
```
方法二：

```
[self.tableView reloadData];
dispatch_async(dispatch_get_main_queue(), ^{
    //刷新完成
});
```
reloadDate会在主队列执行，而dispatch_get_main_queue会等待机会，直到主队列空闲才执行。

类似函数：

```
- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

- (void)scrollToNearestSelectedRowAtScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  // animate at constant velocity to new offset

- (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;
```

当使用[tableView reloadData];刷新数据时，不能直接在后面使用上面的函数。