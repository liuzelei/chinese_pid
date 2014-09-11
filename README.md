# PRC公民身份证号码验证和信息提取

[![Travis](https://travis-ci.org/liuzelei/chinese_pid.svg?branch=master)](https://travis-ci.org/liuzelei/chinese_pid)

## 安装

Gemfile文件中添加:

	gem 'chinese_pid'

bundle:

    $ bundle

或者直接安装:

    $ gem install chinese_pid

## 使用

	ChinesePid.new("your id card").valid? #返回是否通过验证
	ChinesePid.new("your id card").gender #1是男性/0是女性
	ChinesePid.new("your id card").birthday  #Date类型的生日

支持15位和18位身份证号