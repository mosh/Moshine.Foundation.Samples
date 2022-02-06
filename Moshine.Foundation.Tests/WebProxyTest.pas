namespace Moshine.Foundation.Tests;

uses
  Moshine.Foundation.Web,
  RemObjects.Elements.EUnit;

type


  WebProxyTest = public class(Test)
  private
    property Proxy:ProxyForTests read
      begin
        exit new ProxyForTests;
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
      Assert.IsTrue(obj.Origin.Length > 0);
      Assert.IsTrue(obj.Url.Length > 0);
    end;

    method StatusCodeTest;
    begin
      Assert.Catch(method begin Proxy.GetReturnsStatusCode(402); end,'Exception raised');
    end;
  end;

end.