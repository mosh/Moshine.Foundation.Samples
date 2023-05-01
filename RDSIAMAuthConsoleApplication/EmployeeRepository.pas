namespace RDSIAMAuthConsoleApplication;

uses
  Dapper,
  Moshine.Foundation;

type

  Employee = public class
  public
    property Id:Integer;
  end;

  EmployeeRepository = public class
  private
    property builder:IConnectionBuilder;
  public
    constructor(builder:IConnectionBuilder);
    begin
      self.builder := builder;
    end;

    method AllAsync:Task<IEnumerable<Employee>>;
    begin
        using connection := builder.Build do
        begin
          exit await connection.QueryAsync<Employee>('select * from employees');
        end;
    end;
  end;

end.