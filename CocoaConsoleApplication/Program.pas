namespace CocoaConsoleApplication;

uses
  Foundation,
  Moshine.Foundation,
  Moshine.Foundation.Tests,
  RemObjects.Elements.EUnit,
  RemObjects.Elements.RTL;

type
  Program = class
  public

    class method Main(args: array of String): Int32;
    begin
        var lTests := Discovery.DiscoverTests();
      //var lTests := Discovery.FromType(typeOf(IsoTest));
      Runner.RunTests(lTests) withListener(new ConsoleTestListener());

    end;

  end;

end.