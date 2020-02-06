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
      Assert.IsTrue(isoDate.Year=2019);
      //Assert.IsTrue(isoDate.Month=12);
      //Assert.IsTrue(isoDate.Day=30);
      //Assert.IsTrue(isoDate.Hour=16);
      //Assert.IsTrue(isoDate.Minute=46);
      //Assert.IsTrue(isoDate.Second=3);

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
      Assert.IsTrue(isoDate.Year=2019);
      //Assert.IsTrue(isoDate.Month=8);
      //Assert.IsTrue(isoDate.Day=1);
      //Assert.IsTrue(isoDate.Hour=9);
      //Assert.IsTrue(isoDate.Minute=13);
      //Assert.IsTrue(isoDate.Second=);

    end;



  end;

end.