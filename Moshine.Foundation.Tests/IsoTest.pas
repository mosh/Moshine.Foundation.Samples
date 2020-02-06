namespace Moshine.Foundation.Tests;

uses
  Moshine.Foundation,
  RemObjects.Elements.EUnit,
  RemObjects.Elements.RTL;
type

  IsoTest = public class(Test)
  private
  protected
  public
    method ParseTest;
    begin
      var isoString := '2019-12-30T16:46:03-05:00';

      var isoDate := DateTime.ParseISO8601DateTime(isoString);

      Assert.IsNotNil(isoDate);

    end;

    method ToStringTest;
    begin
      var now := DateTime.Now;

      var isoString := DateTime.ToISO8601(now);

      Assert.IsNotNil(isoString);

      Assert.IsTrue(isoString.Contains($'{now.Year}-'));

    end;

    method FromSpecificString;
    begin

      var isoString := '2019-08-01T22:09:13.067+00:00';
      var isoDate := DateTime.ParseISO8601DateTime(isoString);
      Assert.IsNotNil(isoDate);
    end;



  end;

end.