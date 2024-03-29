﻿namespace Moshine.Foundation.Tests;

uses
  Moshine.Foundation.Web;

type

  PostModel = public class
  public
    property Origin:String;
    property Url:String;
  end;


  ProxyForTests = public class(WebProxy)
  private

    property Url:String read
      begin
        exit 'https://httpbin.org';
      end;

  public

    method GetReturnsStatusCode(code:Integer);
    begin
      var getUrl := $'{Url}/status/{code}';
      WebRequestAsString('GET',getUrl,nil,false);
    end;

    method Get:String;
    begin
      var getUrl := $'{Url}/get';
      exit WebRequestAsString('GET',getUrl,nil,false);
    end;

    method Post:PostModel;
    begin

      var postUrl := $'{Url}/post';

      {$IFDEF TOFFEE OR DARWIN}
      var value := WebRequestAs<Foundation.NSDictionary>('POST',postUrl,nil,false);
      if(assigned(value))then
      begin
        var obj := new PostModel;
        obj.Origin := value.valueForKey('origin') as String;
        obj.Url := value.valueForKey('url') as String;
        exit obj;
      end;
      {$ELSE}
      exit WebRequestAs<PostModel>('POST',Url,false);
      {$ENDIF}

    end;

  end;


end.