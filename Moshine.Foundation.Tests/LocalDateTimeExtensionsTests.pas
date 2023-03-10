namespace Moshine.Foundation.Tests;

{$IFDEF ECHOES}

uses
  Moshine.Foundation,
  NodaTime,
  RemObjects.Elements.EUnit;

type
  LocalDateTimeExtensionsTests = public class(Test)
  public
    method ToDateTimeOffset;
    begin
      var local := new LocalDateTime(2023,4,5,5,0,0);

      var offsetLocal := local.ToDateTimeOffset(-4);

      Assert.IsTrue(offsetLocal.Year=2023);
      Assert.IsTrue(offsetLocal.Month=4);
      Assert.IsTrue(offsetLocal.Day=5);
      Assert.IsTrue(offsetLocal.Hour=1);
    end;
  end;
{$ENDIF}
end.