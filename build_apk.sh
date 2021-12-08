# app产物路径
build_app_path="build/app/outputs/apk/release/"
# 打包产物放置路径，需要根据存放位置修改
build_output_path="C:\\"

function checkPath() {
    if [ ! -d "$1" ]; then
      mkdir "$1"
      echo " ${1} is created"
    else
      echo " ${1} is exist"
    fi
}

# 执行打包脚本
flutter build apk --dart-define=APP_CHANNEL=$1 --dart-define=VERSION_CODE=$2 --dart-define=VERSION_NAME=$3
# 复制打包产物到对应位置
cd $build_app_path || exit
checkPath "${build_output_path}/${1}"
cp -R *.apk "${build_output_path}/${1}/"
cd "${build_output_path}/${1}/" || exit
open .