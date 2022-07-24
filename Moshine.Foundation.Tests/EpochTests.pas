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

    method Diff;
    begin
      var startDate := DateTime.UtcNow;
      var endDate := startDate.AddHours(3);

      var startValue := startDate.TimeSinceEpoch;
      var endValue := endDate.TimeSinceEpoch;

      Assert.IsTrue(endValue > startValue);

      Log($'{startValue}');
      Log($'{endValue}');

    end;

  end;

end.