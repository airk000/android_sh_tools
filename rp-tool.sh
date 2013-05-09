#!/bin/bash
#
# Writen by airk@home 20130329 for gerrit config files
# 用来给Gerrit平台生成配置文件，主要包括两个重要文件：
#	1.replication.config 用来提供给replication插件使用，从而达到自动合并的目的；
#	2.secure.config 用来辅助replication插件使用，在与本地仓储合并时并不需要，但
# 是如果用github等需要用户密码验证的就需要这个文件来辅助而达到使用目的。
#

CL_RED="\033[31m"
CL_GRN="\033[32m"
CL_YLW="\033[33m"
CL_BLU="\033[34m"
CL_MAG="\033[35m"
CL_CYN="\033[36m"
CL_RST="\033[0m"

function input_arg
{
echo -e ${CL_RED}"输入x退出！"${CL_RST}
echo
read -p "生成配置文件所需的源目录      ：" SOURCEDIR
case $SOURCEDIR in
X|x)
    echo -e "退出\n"
    exit 0
esac

read -p "输出replication配置文件路径为 ：" RPCFGFILE
case $RPCFGFILE in
X|x)
    echo -e "退出\n"
    exit 0
esac

read -p "输出secure配置文件路径为      ：" SCCFGFILE
case $SCCFGFILE in
X|x)
    echo -e "退出\n"
    exit 0
esac

echo
read -p "以上输入参数是否正确[Y/n]？" rightarg
case $rightarg in
Y|y)
    ;;
N|n)
    input_arg
    ;;
*)
    ;;
esac
}

input_arg

for i in `ls $SOURCEDIR`
do
    var=$i
    remote="[remote \"${var%.git}\"]"
    url1="url = /data/shenduos-opensource/\${name}.git"
    url2="url = https://github.com/\${name}.git"
    repinfo="$remote\n\t$url1\n\t$url2"
    echo -e $repinfo >> $RPCFGFILE
    username="username = xxx"
    password="password = xxx"
    scinfo="$remote\n\t$username\n\t$password"
    echo -e $scinfo >> $SCCFGFILE
done

echo -e ${CL_GRN}"所有配置文件已经成功生成："${CL_RST}
echo -e ${CL_GRN}"\treplication配置文件\t >> \t$RPCFGFILE"${CL_RST}
echo -e ${CL_GRN}"\tsecure配置文件\t\t >> \t$SCCFGFILE"${CL_RST}

exit 0
