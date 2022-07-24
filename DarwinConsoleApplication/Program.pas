namespace DarwinConsoleApplication;

uses
  Moshine.Foundation.Tests,
  RemObjects.Elements.EUnit;

begin
  //var lTests := Discovery.DiscoverTests();
  //var lTests := Discovery.FromType(typeOf(EpochTests));
  var lTests := Discovery.FromType(typeOf(DateTimeTests));

  Runner.RunTests(lTests) withListener(new ConsoleTestListener());

end.