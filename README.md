# YJProgressHUD

<p><br />1、详细图文教程：<br />http://www.cnblogs.com/yajunLi/p/5822702.html</p>
<p>&nbsp;</p>
<p>2、代码集成</p>
<p>下载Demo，拷贝YJProgressHUD文件即可。</p>
<p><br />3、使用方法：</p>
<p>MBProgressHUD的使用，临时总结了几款最常用的使用场景：</p>
<p>1、提示消息</p>
<div class="cnblogs_Highlighter">
<pre class="brush:objc;gutter:true;"> [YJProgressHUD showMessage:@"显示文字，1s隐藏" inView:self.view];
            
  //如果想设置N秒隐藏，用这个
 [YJProgressHUD showMessage:@"显示文字，Ns隐藏" inView:self.view afterDelayTime:3.0];
</pre>
</div>
<p>　　</p>

<p>2、加载成功</p>
<div class="cnblogs_Highlighter">
<pre class="brush:objc;gutter:true;">[YJProgressHUD showSuccess:@"加载成功" inview:self.view];
</pre>
</div>

<p><span style="line-height: 1.5;">&nbsp;</span></p>
<p>3、加载中</p>
<div class="cnblogs_Highlighter">
<pre class="brush:objc;gutter:true;"> //菊花
 [YJProgressHUD showProgress:@"加载中..." inView:self.view];
</pre>
</div>

<p><span style="line-height: 1.5;">4、自定义动画（序列帧实现）</span></p>
<div class="cnblogs_Highlighter">
<pre class="brush:objc;gutter:true;"> //使用这种，必须保证Assets里，添加了图片组，这里提示内容不写（用@""），就只显示动画，写了内容，是一起显示
 [YJProgressHUD showCustomAnimation:@"" withImgArry:[self getRandomImgArry] inview:self.view];
</pre>
</div>

<p><span style="line-height: 1.5;">5、隐藏提示框</span></p>
<div class="cnblogs_Highlighter">
<pre class="brush:objc;gutter:true;">[YJProgressHUD hide];
</pre>
</div>
<p>　　</p>
<p>&nbsp;</p>

