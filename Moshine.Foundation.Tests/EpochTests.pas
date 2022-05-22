namespace Moshine.Foundation.Tests;

uses
  Moshine.Foundation,
  RemObjects.Elements.EUnit;

type

  EpochTests = public class(Test)
  public
    method GetValue;
    begin
      var value := DateTime.TimeSinceEpochNow;
      writeLn(value);
      Assert.IsTrue(value>0);
    end;
  end;

end.