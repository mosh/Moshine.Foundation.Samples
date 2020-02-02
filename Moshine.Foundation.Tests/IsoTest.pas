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

      if(assigned(isoDate))then
      begin
        //NSLog('%@','Got a date');
      end
      else
      begin

      end;

    end;

    method ToStringTest;
    begin

    end;



  end;

end.