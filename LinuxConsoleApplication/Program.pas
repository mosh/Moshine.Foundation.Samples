namespace LinuxConsoleApplication;

uses
  Moshine.Foundation.Tests,
  RemObjects.Elements.EUnit;

type
  Program = class
  public

    class method Main(args: array of String): Int32;
    begin
      //var lTests := Discovery.DiscoverTests();
      var lTests := Discovery.FromType(typeOf(EpochTests));
      Runner.RunTests(lTests) withListener(new ConsoleTestListener());
    end;

  end;

end.