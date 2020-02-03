namespace WebApplication14;

uses
  Carter,
  System,
  System.Collections.Generic,
  System.Linq,
  System.Threading.Tasks,
  Microsoft.AspNetCore.Authentication,
  Microsoft.AspNetCore.Builder,
  Microsoft.AspNetCore.Hosting,
  Microsoft.AspNetCore.HttpsPolicy,
  Microsoft.Extensions.Configuration,
  Microsoft.Extensions.DependencyInjection,
  Microsoft.Extensions.Hosting;

type

  MyAuthenticationOptions = public class (AuthenticationSchemeOptions)
  end;

  Startup = public class
  public

    constructor(aConfiguration: IConfiguration);
    begin
      Configuration := aConfiguration;
    end;

    property Configuration: IConfiguration read;

    // This method gets called by the runtime. Use this method to add services to the container.
    method ConfigureServices(services: IServiceCollection);
    begin
      services.AddCarter();
      services.AddAuthentication(MyAuthHandler.AuthenticationScheme)
        .AddScheme<MyAuthenticationOptions, MyAuthHandler>(MyAuthHandler.AuthenticationScheme, nil);
      services.AddAuthorization;
      services.AddControllers();

    end;

    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    method Configure(app: IApplicationBuilder; env: IWebHostEnvironment);
    begin
      if env.IsDevelopment then
      begin
        app.UseDeveloperExceptionPage;
      end;

      app.UseRouting();

      app.UseAuthentication;
      app.UseAuthorization;

      app.UseEndpoints((endpoints) -> begin
        endpoints.MapCarter;
        endpoints.MapControllers;

      end);
    end;

  end;

end.