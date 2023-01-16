namespace Moshine.Foundation.Tests;

uses
  Moshine.Foundation,
  RemObjects.Elements.EUnit;

type
  {$IF TOFFEE OR DARWIN}

  DoubleTests = public class(Test)
  private
  protected
  public

    method PrecisionOfTwo;
    begin
      var value:Double := 145.12334567;

      var stringValue := value.ToString(2);

      Assert.AreEqual(stringValue, '145.12');
    end;

    method PrecisionOfFour;
    begin
      var value:Double := 145.12334567;

      var stringValue := value.ToString(4);

      Assert.AreEqual(stringValue, '145.1233');
    end;

    method PrecisionOfSix;
    begin
      var value:Double := 145.12334567;

      var stringValue := value.ToString(6);

      Assert.AreEqual(stringValue, '145.123346');
    end;


  end;
  {$ENDIF}

end.