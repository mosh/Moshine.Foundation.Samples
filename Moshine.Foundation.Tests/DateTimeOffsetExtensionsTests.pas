namespace Moshine.Foundation.Tests;

{$IFDEF ECHOES}

uses
  Moshine.Foundation,
  RemObjects.Elements.EUnit;

type

  DateTimeOffsetExtensionsTests = public class(Test)
  public
    method ToLocal;
    begin
      var someOffset := new DateTimeOffset(2023,4,5,1,0,0,TimeSpan.FromHours(-4));

      var localTime := someOffset.OffsetToLocalDateTime;

      Assert.IsTrue(localTime.Year = 2023);
      Assert.IsTrue(localTime.Month = 4);
      Assert.IsTrue(localTime.Day = 4);
      Assert.IsTrue(localTime.Hour = 21);

    end;
  end;

{$ENDIF}

end.