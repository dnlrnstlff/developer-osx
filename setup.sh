#! /bin/bash

pushd `dirname $0` > /dev/null
THISVER='ver1.0'
THISPATH=`pwd -P`
popd > /dev/null

source $THISPATH/Setup/mixins.sh

source $THISPATH/Setup/welcome.sh
#source $THISPATH/Setup/Run/xcode.sh
#source $THISPATH/Setup/Run/brew.sh
#source $THISPATH/Setup/Run/npm.sh
#source $THISPATH/Setup/Run/ruby.sh
#source $THISPATH/Setup/Run/heroku.sh
#source $THISPATH/Setup/Run/apps.sh
source $THISPATH/Setup/Run/terminal.sh
