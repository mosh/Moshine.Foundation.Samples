namespace WebApplication14.Modules;

uses
  Carter,
  Carter.Response,
  Microsoft.AspNetCore.Http,
  System.Threading.Tasks,
  WebApplication14;

type

  SomeClass = public class
  public
    property Id:Integer;
    property Name:String;
  end;

  HomeModule = public class(CarterModule)
  public
    constructor;
    begin

      Get('/', (req, res) ->
        begin
          res.StatusCode := 200;
          exit res.WriteAsync('Theres no place like 127.0.0.1');

        end);

      Post('/', (req, res) ->
        begin
          res.StatusCode := 200;
          exit res.AsJson(new SomeClass(Id := 2, Name := 'John Smith'));
        end);

      After := method(ctx:HttpContext)
        begin
          Console.WriteLine('See you later');
          exit Task.CompletedTask;
          end;

      Before := method(ctx:HttpContext)
        begin
          exit Task.FromResult(true);
        end;
    end;
  end;
end.