namespace WebApplication14;

uses
  System,
  System.Collections.Generic,
  System.Linq,
  System.Threading.Tasks,
  Microsoft.AspNetCore.Hosting,
  Microsoft.Extensions.Configuration,
  Microsoft.Extensions.Hosting,
  Microsoft.Extensions.Logging;

type
  Program = public class
  public

    class method Main(args: array of String);
    begin
      CreateHostBuilder(args).Build.Run;
    end;

    class method CreateHostBuilder(args: array of String): IHostBuilder;
    begin
      result := Host.CreateDefaultBuilder(args).ConfigureWebHostDefaults(webBuilder -> begin
        webBuilder.UseStartup<Startup>();
      end);
    end;

  end;

end.