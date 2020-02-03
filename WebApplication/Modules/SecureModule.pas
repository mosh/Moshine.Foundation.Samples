namespace WebApplication14.Modules;

uses
  Carter,
  Microsoft.AspNetCore.Http,
  WebApplication14, System.Threading.Tasks;
type
  SecureModule = public class(CarterModule)
  public
    constructor;
    begin
      self.RequiresAuthorization;

      Before := method(ctx:HttpContext)
        begin

          if(assigned(ctx.User))then
          begin


            Console.WriteLine($'Identity is {typeOf(ctx.User.Identity)} Name {ctx.User.Identity.Name} {ctx.User.Identity.AuthenticationType} ');
          end;

          exit Task.FromResult(true);
        end;

    end;
  end;
end.