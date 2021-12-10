#!/bin/bash

#Name: idkit_assets
#Desc: Flutter 项目资源便捷处理脚本
#Use : `bash idkit_assets.sh`  或者 `chmod +x idkit_assets.sh`

## 声明一些变量
# 模块名
ModuleName=Null
# 资源管理文件路径
SourceFilePath=""
# 资源管理文件夹路径
SourceMenuPath="assets"
# 原始 pubspec.yaml 路径
PubspecPath="pubspec.yaml"
# 临时存放文件目录路径的文件
TempMenusPath="temp_menupath.txt"
# 临时存放文件目录路径的文件
TempSourcesPath="temp_sourcepath.txt"
# 临时存放修改后的 pubspec.ymal
TempPubspecPath='temp_pubspec.yaml'
# 临时图片名字
TempSourceName=""


# 判断给定文件是否存在,存在清空内容;不存在就创建
function checkStateFromFile() {
    if [ -f $1 ]; then
        :> $1
    else
        touch "$1"
    fi
}


# 创建资源管理类
function createReSourceManageClass() {
    read -p "请输入资源管理的类名:" name
    if [ -z $name ]; then
        name="R"
        echo "class $name {" > $SourceFilePath
    else
        if echo "$name" | grep -q '^[A-Z][A-Za-z]*$'; then
            echo "class $name {" > $SourceFilePath
        else
            echo "提示:类名必须由字母组成，并且首字母为大写。"
            createReSourceManageClass
        fi
    fi
}


# 获取合格资源管理文件名(*)
function getRegularNameOfFile() {
    read -p "请输入资源管理的文件名:" name
    if [ -z "$name" ]; then
        name="assets"
        SourceFilePath="lib/$name.dart"
        checkStateFromFile $SourceFilePath
    else
        if echo "$name" | grep -qe '^[a-z][a-z_]*$'; then
            # 过滤名字结尾是下划线
            if echo "$name" | grep -qe '[a-z]$'; then
                SourceFilePath="lib/$name.dart"
                checkStateFromFile $SourceFilePath
            else
                echo "提示:文件名不能以下滑线结尾。"
                getRegularNameOfFile
            fi
        else
            echo "提示:文件名必须由小写字母或者下滑线组成。"
            getRegularNameOfFile
        fi
    fi
}


# 资源引用名转化规则
function transformRules() {
    if echo $1 | grep -q "^[a-zA-Z]\+"; then
        # 获取所有下划线和后面的第一个内容
        ArrList=$(echo $1 | grep '_[A-Za-z0-9]\?' -o)
        Result=$1
        for item in ${ArrList[@]}
        do
            # 全部转成大写
            upper=$(echo $item | tr '[a-z]' '[A-Z]')
            # 字符替换
            Result=$(echo ${Result/$item/${upper:1}})
        done
        TempSourceName=$Result
    else
        TempSourceName="error_$1"
    fi
}


# 资源重名处理
function doDuplicateName() {
    Num=$(grep -cw "$1" $TempSourcesPath)
    if [ $Num  -gt 0 ]; then
        TempSourceName="$1_$(date +%s)"
    fi
}


# 获取文件夹路径和文件路径
function getAllPathOfSourceManagmentMenu() {
    for file in `ls $1`
    do
        FilePath=$1/$file
        if [ -d $FilePath ]; then
            echo $FilePath >> $TempMenusPath
            getAllPathOfSourceManagmentMenu $FilePath
        else
            name=$(echo $file | cut -d . -f 1)
            transformRules $name
            doDuplicateName $TempSourceName
            if [ $ModuleName = Null ]; then
              assetName="$FilePath"
            else
              assetName="packages/$ModuleName/$FilePath"
            fi
            echo "  static String $TempSourceName = '$assetName';" >> $TempSourcesPath
        fi
    done
}


# 判断资源文件夹是否存在
function checkExistOfSourceManagmentMenu() {
    if [ -d $SourceMenuPath ]; then
        checkStateFromFile $TempMenusPath
        checkStateFromFile $TempSourcesPath
        # 将资源本身写入
        echo "$SourceMenuPath" >> $TempMenusPath
        getAllPathOfSourceManagmentMenu $SourceMenuPath
    else
        mkdir $SourceMenuPath
        echo "欢迎使用 idkit_asset 脚本便捷处理 Flutter 项目资源。" > "$SourceMenuPath/readme.txt"
        checkExistOfSourceManagmentMenu
    fi
}


# 资源管理类的补充完整
function complateSourceManagmentClass() {
    while read line
    do
        # 注意小数点(转移)
        result=$(grep "$line/[A-Za-z0-9_]\+\." $TempSourcesPath)
        if [ -n "$result" ]; then
            echo "  /// $line" >> $SourceFilePath
            # 双引号保留换行符
            echo "$result" >> $SourceFilePath
        fi
    done < $TempMenusPath
    echo "}" >> $SourceFilePath
}


# 改写 pubspec.yaml 文件
function adaptPubspecFile() {
    checkStateFromFile $TempPubspecPath
    # 避免多次添加
    local AssetsExit=0
    # 按文件原格式读取
    IFS=""
    while read line
    do
        # 清除空格
        TrimRes=$(echo $line | awk '$1=$1')
        if echo $TrimRes | grep -qE "^# assets:|^assets:"; then
            # 避免多次构建
            if [ $AssetsExit -eq 0 ]; then
                echo "  assets:" >> $TempPubspecPath
                while read menu
                do
                    echo "    - $menu/" >> $TempPubspecPath
                done < $TempMenusPath
            else
                AssetsExit=1
            fi
        elif echo $TrimRes | grep -qE ".(png|webp|gif|jpeg|svg|json|\/)$"; then
            continue
        else
            echo $line >> $TempPubspecPath
        fi
    done < $1
}


# 将改写的 pubspec.yaml 重定向
function redirectPubspec() {
    cat $TempPubspecPath > $1
}


# 清除临时文件
function dismissTempFile() {
    rm -rf $1 $2 $3
}


# 脚本主入口
function main() {
    echo "|==========    Flutter资源便捷处理 -- 开始    ==========|"
    getRegularNameOfFile
    createReSourceManageClass
    checkExistOfSourceManagmentMenu
    complateSourceManagmentClass
    adaptPubspecFile $PubspecPath
    redirectPubspec $PubspecPath
    dismissTempFile $TempPubspecPath $TempMenusPath $TempSourcesPath
    echo "|==========    Flutter资源便捷处理 -- 结束    ==========|"
    exit
}


# 脚本开始
main

