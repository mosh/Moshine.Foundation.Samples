namespace CocoaConsoleApplication;

uses
  Foundation,
  Moshine.Foundation,
  Moshine.Foundation.Tests,
  RemObjects.Elements.EUnit,
  RemObjects.Elements.RTL;

begin
  //var lTests := Discovery.DiscoverTests();
  //var lTests := Discovery.FromType(typeOf(EpochTests));
  var lTests := Discovery.FromType(typeOf(WebProxyTest));
  Runner.RunTests(lTests) withListener(new ConsoleTestListener());

end.