package com.dishanqian.sanchiManager.utils.realm;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

public class CustomRealm extends AuthorizingRealm{

	/**
	 * 用于授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
		//从principals获取主身份信息
		String userCode = (String)principals.getPrimaryPrincipal();
		//根据身份信息获取权限信息
		//连接数据库
		//从数据库中查出数据
		List<String>permissions = new ArrayList<String>();
		permissions.add("user:create");
		permissions.add("user:delete");
		
		List<String> roles=new ArrayList<String>();
		roles.add("admin");
		
		SimpleAuthorizationInfo simpleAuthorizationInfo = new  SimpleAuthorizationInfo();
		
		simpleAuthorizationInfo.addStringPermissions(permissions);
		
		simpleAuthorizationInfo.addRoles(roles);
		
		return simpleAuthorizationInfo;
	}

	/**
	 * 用于认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//一。从token中取出身份
		String userCode =(String)token.getPrincipal();
		
		//二。根据userCode从数据库查询 如果查询不到返回null，如果查询到返回认证信息AuthenticationInfo
		if(!userCode.equals("zhengyan"))
			return null;
		//查询密码
		//这里的密码是数据库查出来的经过加盐md5加密
		String password="3ef7164d1f6167cb9f2658c07d3c2f0a";
		String salt="admin";
		
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(userCode, password, ByteSource.Util.bytes(salt), this.getName());
		//SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(userCode, password, this.getName());
		
		
		return simpleAuthenticationInfo;
	}

}
