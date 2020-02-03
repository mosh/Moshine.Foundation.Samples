namespace WebApplication14;

uses
  System.Security.Claims,
  System.Security.Principal,
  Microsoft.AspNetCore.Authentication,
  Microsoft.Extensions.Logging,
  Microsoft.Extensions.Options,
  System.Text.Encodings.Web,
  System.Threading.Tasks;

type

  MyIdentity = public class(IIdentity)

  property AuthenticationType: String read 'John';
  property IsAuthenticated: Boolean read true;
  property Name: String read 'Some Name';

  end;

  MyAuthHandler = public class(AuthenticationHandler<MyAuthenticationOptions>)
  public
    class const AuthenticationScheme = 'MyScheme';
  protected

    method HandleAuthenticateAsync: System.Threading.Tasks.Task<AuthenticateResult>; override;
    begin

      var identity := new ClaimsIdentity(new MyIdentity);
      var principal := new ClaimsPrincipal(identity);

      exit Task.FromResult(AuthenticateResult.Success(new AuthenticationTicket(principal, AuthenticationScheme)));
    end;

    /*
    constructor ApiAuthHandler(options: IOptionsMonitor<MyAuthenticationOptions>; logger: ILoggerFactory; encoder: UrlEncoder; clock: ISystemClock);
    begin
      inherited constructor (options, logger, encoder, clock);
    end;
    */



  end;


end.