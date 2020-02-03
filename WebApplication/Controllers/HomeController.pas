namespace WebApplication14;

uses
  Microsoft.AspNetCore.Authorization,
  Microsoft.AspNetCore.Mvc, System.Collections.Generic;

type
  [ApiController]
  [Route("[controller]")]
  [Authorize(AuthenticationSchemes := MyAuthHandler.AuthenticationScheme )]
  HomeController = public class(ControllerBase)
  public

    [HttpGet]
    method Get: IEnumerable<String>;
    begin
      exit ['1','2','3'];
    end;

  end;
end.