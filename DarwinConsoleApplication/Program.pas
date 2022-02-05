namespace DarwinConsoleApplication;

uses
  Moshine.Foundation.Tests,
  RemObjects.Elements.EUnit;

begin
  //var lTests := Discovery.DiscoverTests();
  var lTests := Discovery.FromType(typeOf(IsoTest));
  Runner.RunTests(lTests) withListener(new ConsoleTestListener());

end.