namespace Moshine.Foundation.Tests;

uses

  Moshine.Foundation.Web,
  RemObjects.Elements.EUnit;

type

  SomeClass = public class
  public
    property Id:Integer;
    property Name:String;
  end;


  MyProxy = public class(WebProxy)
  private
    property Url:String read
      begin
        exit 'http://localhost:8080/';
      end;

  public
    method Get;
    begin
      WebRequestAsString('GET',Url,nil,false);
    end;

    method Post:SomeClass;
    begin

      {$IFDEF TOFFEE}
      var value := WebRequestAs<Foundation.NSDictionary>('POST',Url,nil,false);
      if(assigned(value))then
      begin
        var obj := new SomeClass;
        obj.Id := value.valueForKey('id') as Integer;
        obj.Name := value.valueForKey('name') as String;
        exit obj;
      end;
      {$ELSE}
      exit WebRequestAs<SomeClass>('POST',Url,false);
      {$ENDIF}

    end;
                                                                 end;

  WebProxyTest = public class(Test)
  private
    property Proxy:MyProxy read
      begin
        exit new MyProxy;
      end;
  public
    method GetTest;
    begin
      Proxy.Get;
    end;

    method PostTest;
    begin
      var obj := Proxy.Post;
      Assert.IsNotNil(obj);
      Assert.IsTrue(obj.Id = 2);
      Assert.IsTrue(obj.Name = 'John Smith');
    end;
  end;

end.