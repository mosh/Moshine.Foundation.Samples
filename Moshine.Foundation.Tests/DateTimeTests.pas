namespace Moshine.Foundation.Tests;

uses
  RemObjects.Elements.EUnit;

type
  DateTimeTests = public class(Test)
  public

    method UtcTicks;
    begin

      var ticksFromNow := DateTime.UtcNow.Ticks;
      Log($'{ticksFromNow}');

    end;

    method TicksToDateTime;
    begin

      var ticksFromNow := DateTime.UtcNow.Ticks;
      Log($'{ticksFromNow}');
      var newDate := new DateTime(ticksFromNow);
      Log($'{newDate}');

    end;

    method Diff;
    begin
      var diffFromSubtract := DateTime.UtcNow - new DateTime(1970,1,1);
      Log($'{diffFromSubtract}');
    end;

    method TicksDiff;
    begin
      var ticks := DateTime.UtcNow.Ticks - new DateTime(1970,1,1).Ticks;
      Log($'{ticks}');
    end;

    method TicksSince1970;
    begin
      var ticks := new DateTime(1970,1,1).Ticks;
      Log($'{ticks}');

    end;

    method Ticks1970ToDateTime;
    begin
      var dateTime := new DateTime(new DateTime(1970,1,1).Ticks);
      Log($'{dateTime}');
    end;

    {$IF NOT ISLAND}
    method IsUtc;
    begin
      var dateTime := new DateTime(1970,1,1);
      Log($'{dateTime.IsUTC}');

    end;

    {$ENDIF}
  end;

end.