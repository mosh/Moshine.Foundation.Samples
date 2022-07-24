namespace Moshine.Foundation.Tests;

uses
  Moshine.Foundation,
  RemObjects.Elements.System,
  RemObjects.Elements.EUnit;

type

  [Island]
  Employee = public class
  public
    property Id:Integer;
    property Name:String;
  end;

  {$IF ISLAND}
  DictionaryTests = public class(Test)
  public
    method SimpleTypes;
    begin
      var obj:= new Employee(Id:=2, Name:='Bob Smith');
      var dict:=obj.ToDictionary;
    end;
  end;
  {$ENDIF}

end.