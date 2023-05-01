namespace RDSIAMAuthConsoleApplication;


uses
  Amazon,
  Amazon.Runtime,
  Amazon.Runtime.CredentialManagement,
  Dapper,
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


  var username := 'databaseworker';
  var database := 'employees';

  var factory := new ProfileCredentialsFactory(username, loggerFactory.CreateLogger<ProfileCredentialsFactory>);

  var databaseConfig := new PostgresDatabaseConfig(
        Host:= 'database-1.cgsvr1y5jaxg.us-east-2.rds.amazonaws.com',
        Port := 5432,
        Username := username,
        SearchPath := database,
        Database := database);

  var generator := new AWSTokenGenerator(factory, RegionEndpoint.USEast2);

  var builder := new RDSPostgresBuilder(generator, databaseConfig);

  var repository := new EmployeeRepository(builder);

  var rows := await repository.AllAsync;

  if(rows.Any)then
  begin
    Console.WriteLine('Rows');
  end
  else
  begin
    Console.WriteLine('No Rows');
  end;

end.