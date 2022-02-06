namespace CoreConsoleApplication;

uses
  Moshine.Foundation.Tests,
  RemObjects.Elements.EUnit,
  System.Linq;

begin
  //var lTests := Discovery.DiscoverTests();
  //var lTests := Discovery.FromType(typeOf(IsoTest));
  var lTests := Discovery.FromType(typeOf(WebProxyTest));
  Runner.RunTests(lTests) withListener(new ConsoleTestListener());

end.