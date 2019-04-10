#!/bin/sh
export KSROOT=/koolshare
source $KSROOT/scripts/base.sh
eval `dbus export koolproxyR_`
alias echo_date='echo $(date +%Y年%m月%d日\ %X):'

# url_daily="https://kprules.b0.upaiyun.com/daily.txt"
# url_kp="https://kprules.b0.upaiyun.com/kp.dat"
# url_koolproxy="https://kprules.b0.upaiyun.com/koolproxy.txt"
# 原网址跳转到https://kprule.com/koolproxy.txt跳转到又拍云，为了节省时间，还是直接去又拍云下载吧！避免某些时候跳转不过去
url_easylist="http://tools.yiclear.com/ChinaList2.0.txt"
url_abx="https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/ABP-FX.txt"
url_fanboy="https://easylist-downloads.adblockplus.org/fanboy-annoyance.txt"

update_rule(){
	echo =======================================================================================================
	echo_date 开始更新koolproxyR规则，请等待...
	
	# update KP官方规则 以后此规则都不需要更新了
	# if [ "$koolproxyR_basic_koolproxyR_update" == "1" ] || [ -n "$1" ];then
	# 	echo_date " ---------------------------------------------------------------------------------------"
	# 	wget --no-check-certificate --timeout=8 -qO - $url_koolproxy > /tmp/koolproxy.txt
	# 	rules_date_local=`cat $KSROOT/koolproxyR/data/rules/koolproxy.txt  | sed -n '3p'|awk '{print $3,$4}'`
	# 	rules_date_local1=`cat /tmp/koolproxy.txt  | sed -n '3p'|awk '{print $3,$4}'`
	# 	if [ ! -z "$rules_date_local1" ];then
	# 		if [ "$rules_date_local" != "$rules_date_local1" ];then
	# 			echo_date 检测到新版本 koolproxy规则，开始更新...
	# 			echo_date 将临时文件覆盖到原始koolproxy规则文件
	# 			mv /tmp/koolproxy.txt $KSROOT/koolproxyR/data/rules/koolproxy.txt
	# 			wget --no-check-certificate --timeout=8 -qO - $url_daily > $KSROOT/koolproxyR/data/rules/daily.txt
	# 			wget --no-check-certificate --timeout=8 -qO - $url_kp > $KSROOT/koolproxyR/data/rules/kp.dat
	# 		else
	# 			echo_date 检测到koolproxy规则本地版本号和在线版本号相同，那还更新个毛啊!
	# 		fi
	# 	else
	# 		echo_date koolproxy规则文件下载失败！
	# 	fi
	# fi
	
	
	# update 中国简易列表 2.0
	if [ "$koolproxyR_basic_easylist_update" == "1" ] || [ -n "$1" ];then
		echo_date " ---------------------------------------------------------------------------------------"
		wget --no-check-certificate --timeout=8 -qO - $url_easylist > /tmp/ChinaList2.0.txt
		easylist_rules_local=`cat $KSROOT/koolproxyR/data/rules/ChinaList2.0.txt  | sed -n '3p'|awk '{print $3,$4}'`
		easylist_rules_local1=`cat /tmp/ChinaList2.0.txt  | sed -n '3p'|awk '{print $3,$4}'`
		if [ ! -z "$easylist_rules_local1" ];then
			if [ "$easylist_rules_local" != "$easylist_rules_local1" ];then
				echo_date 检测到新版本 中国规则 2.0 ，开始更新...
				echo_date 将临时文件覆盖到原始 中国规则2.0文件
				mv /tmp/ChinaList2.0.txt $KSROOT/koolproxyR/data/rules/ChinaList2.0.txt
			else
				echo_date 检测到 中国规则2.0本地版本号和在线版本号相同，那还更新个毛啊!
			fi
		else
			echo_date 中国规则2.0文件下载失败！
		fi
	fi
	
	# update 乘风规则
	if [ "$koolproxyR_basic_abx_update" == "1" ] || [ -n "$1" ];then
		echo_date " ---------------------------------------------------------------------------------------"
		wget --no-check-certificate --timeout=8 -qO - $url_abx > /tmp/chengfeng.txt
		abx_rules_local=`cat $KSROOT/koolproxyR/data/rules/chengfeng.txt  | sed -n '3p'|awk '{print $3,$4}'`
		abx_rules_local1=`cat /tmp/chengfeng.txt | sed -n '3p'|awk '{print $3,$4}'`
		if [ ! -z "$abx_rules_local1" ];then
			if [ "$abx_rules_local" != "$abx_rules_local1" ];then
				echo_date 检测到新版本 乘风规则，开始更新...
				echo_date 将临时文件覆盖到原始 乘风规则 文件
				mv /tmp/chengfeng.txt $KSROOT/koolproxyR/data/rules/chengfeng.txt
			else
				echo_date 检测到 乘风规则 本地版本号和在线版本号相同，那还更新个毛啊!
			fi
		else
			echo_date 乘风规则文件下载失败！
		fi
	fi

	# update fanboy规则
	if [ "$koolproxyR_basic_fanboy_update" == "1" ] || [ -n "$1" ];then
		echo_date " ---------------------------------------------------------------------------------------"
		wget --no-check-certificate --timeout=8 -qO - $url_fanboy > /tmp/fanboy-annoyance.txt
		fanboy_rules_local=`cat $KSROOT/koolproxyR/data/rules/fanboy-annoyance.txt  | sed -n '3p'|awk '{print $3,$4}'`
		fanboy_rules_local1=`cat /tmp/fanboy-annoyance.txt  | sed -n '3p'|awk '{print $3,$4}'`
		if [ ! -z "$fanboy_rules_local1" ];then
			if [ "$fanboy_rules_local" != "$fanboy_rules_local1" ];then
				echo_date 检测到新版本 fanboy规则 列表，开始更新...
				echo_date 将临时文件覆盖到原始 fanboy规则 文件
				mv /tmp/fanboy-annoyance.txt $KSROOT/koolproxyR/data/rules/fanboy-annoyance.txt
			else
				echo_date 检测到 fanboy规则 本地版本号和在线版本号相同，那还更新个毛啊!
			fi
		else
			echo_date fanboy规则 文件下载失败！
		fi
	fi

	rm -rf /fanboy-annoyance.txt
	rm -rf /tmp/chengfeng.txt
	rm -rf /tmp/ChinaList2.0.txt
	rm -rf /tmp/koolproxy.txt

	echo_date 剔除KP不支持的规则！

	# 删除导致KP崩溃的规则
	# 听说高手?都打的很多、这样才能体现技术
	sed -i '/^\$/d' $KSROOT/koolproxyR/data/rules/fanboy-annoyance.txt
	sed -i '/\*\$/d' $KSROOT/koolproxyR/data/rules/fanboy-annoyance.txt
	sed -i '/youku.com/d' $KSROOT/koolproxyR/data/rules/fanboy-annoyance.txt
	sed -i '/iqiyi.com/d' $KSROOT/koolproxyR/data/rules/fanboy-annoyance.txt
	sed -i '/v.qq.com/d' $KSROOT/koolproxyR/data/rules/fanboy-annoyance.txt

	# 将白名单转化成https
	cat $KSROOT/koolproxyR/data/rules/fanboy-annoyance.txt | grep "^@@||" | sed 's#^@@||#@@||https://#g' >> $KSROOT/koolproxyR/data/rules/fanboy-annoyance_https.txt
	# 将规则转化成kp能识别的https
	cat $KSROOT/koolproxyR/data/rules/fanboy-annoyance.txt | grep "^||" | sed 's#^||#||https://#g' >> $KSROOT/koolproxyR/data/rules/fanboy-annoyance_https.txt
	cat $KSROOT/koolproxyR/data/rules/fanboy-annoyance.txt | grep -i '^[0-9a-z]'| sed 's#^#https://#g' >> $KSROOT/koolproxyR/data/rules/fanboy-annoyance_https.txt
	# 给github放行
	sed -i '/github/d' $KSROOT/koolproxyR/data/rules/fanboy-annoyance_https.txt

	sed -i '/^\$/d' $KSROOT/koolproxyR/data/rules/ChinaList2.0.txt
	sed -i '/\*\$/d' $KSROOT/koolproxyR/data/rules/ChinaList2.0.txt

	# 将白名单转化成https
	cat $KSROOT/koolproxyR/data/rules/ChinaList2.0.txt | grep "^@@||" | sed 's#^@@||#@@||https://#g' >> $KSROOT/koolproxyR/data/rules/ChinaList2.0_https.txt
	# 将规则转化成kp能识别的https
	cat $KSROOT/koolproxyR/data/rules/ChinaList2.0.txt | grep "^||" | sed 's#^||#||https://#g' >> $KSROOT/koolproxyR/data/rules/ChinaList2.0_https.txt
	cat $KSROOT/koolproxyR/data/rules/ChinaList2.0.txt | grep -i '^[0-9a-z]'| sed 's#^#https://#g' >> $KSROOT/koolproxyR/data/rules/ChinaList2.0_https.txt

	# 给优酷放行，解决一直加载的问题
	echo "@@mp4.ts" >> ChinaList2.0.txt

	echo "||https://valipl.cp31.ott.cibntv.net" >> $KSROOT/koolproxyR/data/rules/ChinaList2.0.txt
	echo "||https://bsv.atm.youku.com" >> $KSROOT/koolproxyR/data/rules/ChinaList2.0.txt
	# 给手机百度图片放行
	sed -i '/baidu.com\/it\/u/d' $KSROOT/koolproxyR/data/rules/ChinaList2.0.txt
	sed -i '/baidu.com\/it\/u/d' $KSROOT/koolproxyR/data/rules/ChinaList2.0_https.txt
	# echo "@@https://f*.baidu.com/it/u=*,*&fm=$third-party" >> ChinaList2.0.txt
	# echo "@@http://f*.baidu.com/it/u=*,*&fm=$third-party" >> ChinaList2.0.txt




	sed -i '/^\$/d' $KSROOT/koolproxyR/data/rules/chengfeng.txt
	sed -i '/\*\$/d' $KSROOT/koolproxyR/data/rules/chengfeng.txt
	sed -i '/youku.com/d' $KSROOT/koolproxyR/data/rules/chengfeng.txt
	sed -i '/iqiyi.com/d' $KSROOT/koolproxyR/data/rules/chengfeng.txt
	sed -i '/v.qq.com/d' $KSROOT/koolproxyR/data/rules/chengfeng.txt

	# 将白名单转化成https
	cat $KSROOT/koolproxyR/data/rules/chengfeng.txt | grep "^@@||" | sed 's#^@@||#@@||https://#g' >> $KSROOT/koolproxyR/data/rules/chengfeng_https.txt
	# 将规则转化成kp能识别的https
	cat $KSROOT/koolproxyR/data/rules/chengfeng.txt | grep "^||" | sed 's#^||#||https://#g' >> $KSROOT/koolproxyR/data/rules/chengfeng_https.txt
	cat $KSROOT/koolproxyR/data/rules/chengfeng.txt | grep -i '^[0-9a-z]'| sed 's#^#https://#g' >> $KSROOT/koolproxyR/data/rules/chengfeng_https.txt


	find $KSROOT/koolproxyR/data/rules -name *.txt |sed 's#.*/##' > $KSROOT/koolproxyR/data/source.list
	sed -i 's/^/0|/' $KSROOT/koolproxyR/data/source.list
	sed -i 's/$/|0|0/' $KSROOT/koolproxyR/data/source.list
	echo "1|user.txt|0|0" >> $KSROOT/koolproxyR/data/source.list


	
	echo_date 所有规则更新完毕！
	# reboot koolproxyR

	echo_date 自动重启koolproxyR，以应用新的规则文件！请稍后！
	sh $KSROOT/koolproxyR/kpr_config.sh restart
	echo =======================================================================================================
}
if [ -n "$1" ];then
	update_rule "$1" > /tmp/upload/kpr_log.txt
	echo XU6J03M6 >> /tmp/upload/kpr_log.txt
	http_response "$1"
else
	update_rule > /tmp/upload/kpr_log.txt
	echo XU6J03M6 >> /tmp/upload/kpr_log.txt
fi
