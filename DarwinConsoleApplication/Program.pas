namespace DarwinConsoleApplication;

uses
  Moshine.Foundation.Tests,
  RemObjects.Elements.EUnit;

begin
  //var lTests := Discovery.DiscoverTests();
  var lTests := Discovery.FromType(typeOf(DoubleTests));
  Runner.RunTests(lTests) withListener(new ConsoleTestListener());

end.