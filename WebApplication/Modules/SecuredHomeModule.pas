namespace WebApplication14.Modules;

type
  SecuredHomeModule = public class(SecureModule)
  public
    constructor;
    begin

      Get('/Secured', (req, res) ->
        begin
          res.StatusCode := 409;
          exit res.WriteAsync('Theres no place like secured 127.0.0.1');

        end);

    end;
  end;

end.