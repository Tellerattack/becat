<%@ page import="java.util.Date" %>
<%@ page import="com.baozi.util.DateUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>BeCat-我喜欢撸猫喜欢宁静的生活</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="shortcut icon" href="/resource/images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="/resource/js/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="/resource/css/index.css" media="all" />
</head>
<body class="main_body">
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->
		<div class="layui-header header">
			<div class="layui-main mag0">
				<a href="javascript:;" class="logo">BeCat</a>
				<!-- 显示/隐藏菜单 -->
				<a href="javascript:;" class="seraph hideMenu icon-caidan"></a>
				<!-- 顶级菜单 -->
				<ul class="layui-nav mobileTopLevelMenus" mobile>
					<li class="layui-nav-item" data-menu="contentManagement">
						<a href="javascript:;"><i class="seraph icon-caidan"></i><cite>BeCat</cite></a>
						<dl class="layui-nav-child">
							<dd class="layui-this" data-menu="contentManagement">
								<shiro:hasPermission name="console:nrgl">
									<a href="javascript:;"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>内容管理</cite></a>
								</shiro:hasPermission>
							</dd>
							<dd data-menu="memberCenter">
								<shiro:hasPermission name="console:yhzx">
									<a href="javascript:;"><i class="seraph icon-icon10" data-icon="icon-icon10"></i><cite>用户中心</cite></a>
								</shiro:hasPermission>
							</dd>
							<dd data-menu="systemeSttings">
								<shiro:hasPermission name="console:xtsz">
									<a href="javascript:;"><i class="layui-icon" data-icon="&#xe620;">&#xe620;</i><cite>系统设置</cite></a>
								</shiro:hasPermission>
							</dd>
						</dl>
					</li>
				</ul>
				<shiro:hasAnyRoles name='超级管理员,系统维护员'>
				<ul class="layui-nav topLevelMenus" pc>
					<li class="layui-nav-item layui-this" data-menu="contentManagement">
						<shiro:hasPermission name="console:nrgl">
							<a href="javascript:;"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>内容管理</cite></a>
						</shiro:hasPermission>
					</li>
					<li class="layui-nav-item" data-menu="memberCenter" pc>
						<shiro:hasPermission name="console:yhzx">
						<a href="javascript:;"><i class="seraph icon-icon10" data-icon="icon-icon10"></i><cite>用户中心</cite></a>
						</shiro:hasPermission>
					</li>
					<li class="layui-nav-item" data-menu="systemeSttings" pc>
						<shiro:hasPermission name="console:xtsz">
							<a href="javascript:;"><i class="layui-icon" data-icon="&#xe620;">&#xe620;</i><cite>系统设置</cite></a>
						</shiro:hasPermission>
					</li>
				</ul>
				</shiro:hasAnyRoles>
				<!-- 顶部右侧菜单 -->
			    <ul class="layui-nav top_menu">
					<li class="layui-nav-item" pc>
						<a href="javascript:;" class="clearCache"><i class="layui-icon" data-icon="&#xe640;">&#xe640;</i><cite>清除缓存</cite><span class="layui-badge-dot"></span></a>
					</li>
					<li class="layui-nav-item lockcms" pc>
						<a href="javascript:;"><i class="seraph icon-lock"></i><cite>锁屏</cite></a>
					</li>
					<li class="layui-nav-item" id="userInfo">
						<a href="javascript:;"><img src="/resource/images/face.jpg" class="layui-nav-img userAvatar" width="35" height="35"><cite class="adminName"><shiro:principal property="username"/></cite></a>
						<shiro:user>
						<dl class="layui-nav-child" userid="<shiro:principal property="userid"/>">
							<dd><a href="javascript:;" data-url="/console/personInfo.shtml"><i class="seraph icon-ziliao" data-icon="icon-ziliao"></i><cite>个人资料</cite></a></dd>
							<dd><a href="javascript:;" data-url="/console/updatepwd.shtml"><i class="seraph icon-xiugai" data-icon="icon-xiugai"></i><cite>修改密码</cite></a></dd>
							<dd><a href="javascript:;" class="showNotice"><i class="layui-icon">&#xe645;</i><cite>系统公告</cite><span class="layui-badge-dot"></span></a></dd>
							<dd pc><a href="javascript:;" class="functionSetting"><i class="layui-icon">&#xe620;</i><cite>功能设定</cite><span class="layui-badge-dot"></span></a></dd>
							<dd pc><a href="javascript:;" class="changeSkin"><i class="layui-icon">&#xe61b;</i><cite>更换皮肤</cite></a></dd>
							<dd><a href="javascript:" onclick="logout();" class="signOut"><i class="seraph icon-tuichu"></i><cite>退出</cite></a></dd>
						</dl>
						</shiro:user>
					</li>
				</ul>
			</div>
		</div>
		<!-- 左侧导航 -->
		<div class="layui-side layui-bg-black">
			<div class="user-photo">
				<a class="img" title="我的头像" ><img src="/resource/images/face.jpg" class="userAvatar"></a>
				<p><span class="userName"><shiro:principal property="username"/></span>, 欢迎登录</p>
			</div>
			<!-- 搜索 -->
			<div class="layui-form component">
				<select name="search" id="search" lay-search lay-filter="searchPage">
					<option value="">搜索页面或功能</option>
					<option value="1">layer</option>
					<option value="2">form</option>
				</select>
				<i class="layui-icon">&#xe615;</i>
			</div>
			<div class="navBar layui-side-scroll" id="navBar">
				<ul class="layui-nav layui-nav-tree">
					<li class="layui-nav-item layui-this" lay-id="1"><a href="javascript:;" data-url="/console/main.shtml"><i class="layui-icon" data-icon=""></i><cite>后台首页</cite></a></li>

					<div id="contentManagementson" class="hideCustom">
						<shiro:hasPermission name="console:blog">
							<li class="layui-nav-item" lay-id="2"><a href="javascript:;"  data-url="/console/blog.shtml"><i class="seraph icon-text" data-icon="icon-text"></i><cite>技术博客列表</cite></a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="console:article">
							<li class="layui-nav-item" lay-id="2"><a href="javascript:;"  data-url="/console/article.shtml"><i class="seraph icon-text" data-icon="icon-text"></i><cite>文章列表</cite></a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="console:image">
							<li class="layui-nav-item" lay-id="3"><a href="javascript:;"  data-url="/console/image.shtml"><i class="seraph icon-text" data-icon="icon-text"></i><cite>服务器图片列表</cite></a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="console:notice">
							<li class="layui-nav-item" lay-id="4"><a href="javascript:;"  data-url="/console/notice.shtml"><i class="seraph icon-text" data-icon="icon-text"></i><cite>公告列表</cite></a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="console:memorabilia">
							<li class="layui-nav-item" lay-id="5"><a href="javascript:;"  data-url="/console/memorabilia.shtml"><i class="seraph icon-text" data-icon="icon-text"></i><cite>大事记列表</cite></a></li>
						</shiro:hasPermission>
					</div>

					<div id="memberCenterson" class="hideCustom">
						<shiro:hasPermission name="console:alluser">
							<li class="layui-nav-item" lay-id="6"><a href="javascript:;"  data-url="/console/alluser.shtml"><i class="seraph icon-text" data-icon="&#xe612;"></i><cite>用户列表</cite></a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="console:allrole">
							<li class="layui-nav-item" lay-id="7"><a href="javascript:;"  data-url="/console/allrole.shtml"><i class="seraph icon-text" data-icon="&#xe612;"></i><cite>角色列表</cite></a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="console:allauthc">
							<li class="layui-nav-item" lay-id="8"><a href="javascript:;"  data-url="/console/allauthc.shtml"><i class="seraph icon-text" data-icon="&#xe612;"></i><cite>权限列表</cite></a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="console:roledistribution">
							<li class="layui-nav-item" lay-id="9"><a href="javascript:;"  data-url="/console/roledistribution.shtml"><i class="seraph icon-text" data-icon="&#xe612;"></i><cite>角色分配</cite></a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="console:authcdistribution">
							<li class="layui-nav-item" lay-id="10"><a href="javascript:;"  data-url="/console/authcdistribution.shtml"><i class="seraph icon-text" data-icon="&#xe612;"></i><cite>权限分配</cite></a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="console:myauthc">
							<li class="layui-nav-item" lay-id="11"><a href="javascript:;"  data-url="/console/myauthc.shtml"><i class="seraph icon-text" data-icon="&#xe612;"></i><cite>我的权限</cite></a></li>
						</shiro:hasPermission>
					</div>

					<div id="systemeSttingsson" class="hideCustom">
						<shiro:hasPermission name="console:syssetting">
							<li class="layui-nav-item" lay-id="12"><a href="javascript:;"  data-url="/console/syssetting.shtml"><i class="seraph icon-text" data-icon="&#xe631;"></i><cite>系统基本参数</cite></a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="console:userlog">
							<li class="layui-nav-item" lay-id="13"><a href="javascript:;"  data-url="/console/userlog.shtml"><i class="seraph icon-text" data-icon="icon-log"></i><cite>用户登录日志</cite></a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="console:syslog">
							<li class="layui-nav-item" lay-id="14"><a href="javascript:;"  data-url="/console/syslog.shtml"><i class="seraph icon-text" data-icon="icon-log"></i><cite>系统日志</cite></a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="console:friend">
							<li class="layui-nav-item" lay-id="15"><a href="javascript:;"  data-url="/console/friend.shtml"><i class="seraph icon-text" data-icon="&#xe64c;"></i><cite>友情链接</cite></a></li>
						</shiro:hasPermission>
						<li class="layui-nav-item" lay-id=""><a href="javascript:;"  data-url="/console/icons.shtml"><i class="seraph icon-text" data-icon="&#xe857;"></i><cite>图标管理</cite></a></li>
					</div>
				</ul>
			</div>
		</div>
		<!-- 右侧内容 -->
		<div class="layui-body layui-form">
			<div class="layui-tab mag0" lay-filter="bodyTab" id="top_tabs_box">
				<ul class="layui-tab-title top_tab" id="top_tabs">
					<li class="layui-this" lay-id="1"><i class="layui-icon">&#xe68e;</i> <cite>后台首页</cite></li>
				</ul>
				<ul class="layui-nav closeBox">
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="layui-icon caozuo">&#xe643;</i> 页面操作</a>
				    <dl class="layui-nav-child">
					  <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
				      <dd><a href="javascript:;" class="closePageOther"><i class="seraph icon-prohibit"></i> 关闭其他</a></dd>
				      <dd><a href="javascript:;" class="closePageAll"><i class="seraph icon-guanbi"></i> 关闭全部</a></dd>
				    </dl>
				  </li>
				</ul>
				<div class="layui-tab-content clildFrame">
					<div class="layui-tab-item layui-show">
						<iframe src="/console/main.shtml"></iframe>
					</div>
				</div>
			</div>
		</div>
		<!-- 底部 -->
		<div class="layui-footer footer">
			<p><span>copyright @ <%=DateUtil.formatDate(new Date(),"yyyy")%> BeCat版权所有</span><span style="margin-left: 20px;">京ICP备18011239号</span></p>
		</div>
	</div>

	<!-- 移动导航 -->
	<div class="site-tree-mobile"><i class="layui-icon">&#xe602;</i></div>
	<div class="site-mobile-shade"></div>

	<script type="text/javascript" src="/resource/js/layui/layui.js"></script>
	<script type="text/javascript" src="/resource/js/manager/index.js"></script>
	<script type="text/javascript" src="/resource/js/manager/cache.js"></script>
</body>
</html>