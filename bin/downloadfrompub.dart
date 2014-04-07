//import 'package:args/args.dart';
import 'package:http/http.dart' as http;
import 'package:archive/archive.dart';
import 'dart:io';




void main( List<String > arguments) {

  String name = "http";
  String version = "0.10.0"; 
  
  void processResponse( http.Response response){
      GZipCodec gzip = new GZipCodec();    
      List<int> archiveAsTar =gzip.decode(  response.bodyBytes);
      
      Archive archive = new TarDecoder().decodeBytes( archiveAsTar);
      for (ArchiveFile file in archive) {
         String filename = file.name;
         List<int> data = file.content;
         
         String target = "C:/Users/hangs_000/AppData/Roaming/Pub/Cache/hosted/pub.dartlang.org/${name}-${version}/${filename}";
         print( target);
         new File(target)
               ..createSync(recursive: true)
               ..writeAsBytesSync(data);
      }
  }
      
  String url = "https://commondatastorage.googleapis.com/pub.dartlang.org/packages/${name}-${version}.tar.gz";
  http.get( url).then( processResponse);
  
  
}
