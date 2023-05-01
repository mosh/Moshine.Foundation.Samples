namespace SecretsConsoleApplication;


uses
  Microsoft.Extensions.Logging,
  Moshine.Foundation.AWS,
  System.Linq,
  System.Threading.Tasks;


begin

  var loggerFactory := LoggerFactory.Create(builder ->
    begin
      builder
      .SetMinimumLevel(LogLevel.Trace)
      .AddConsole;
    end);

  var factory := new ProfileCredentialsFactory('default',loggerFactory.CreateLogger<ProfileCredentialsFactory>);

  var secrets := new AWSSecrets(factory, Amazon.RegionEndpoint.USEast2);

  var values := await secrets.GetSecretAsync('EmployeeCredentials');

  if assigned(values) then
  begin

    for each value in values do
    begin
      Console.WriteLine($'Secret {value.Key} {value.Value}');
    end;
  end
  else
  begin
    Console.WriteLine('Unable to retrieve secret');
  end;


  var cached := new AWSCachedSecrets(factory, Amazon.RegionEndpoint.USEast2, loggerFactory.CreateLogger<AWSCachedSecrets>);

  var value := cached.GetSecretAsync('EmployeeCredentials').Result;

  for each value in values do
  begin
    Console.WriteLine($'Secret {value.Key} {value.Value}');
  end;



end.