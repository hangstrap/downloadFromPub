This dart script was written as a quick and dirty fix for Dart issue 11877 which causes the 'pub get' command to fail on a Windows system

https://code.google.com/p/dart/issues/detail?id=11887

The application downloads the required package from pub.dartlang.org and unpacks it in you pub cache.

To use
* open a command shell and navigate to you dart project
* run the command **pub get**
* if it fails note from the package and version number of the package that could not be downloaded
* run this dart script with the package and version number as command line parameters
* run the command **pub get** again

For example, to download package *matcher*, version *0.1.2* run the following command **dart ..\downloadFromPub\bin\downloadfrompub.dart matcher 0.10.0** 
