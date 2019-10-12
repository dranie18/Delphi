unit MysqlConnection;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.Drivers.FireDac,  
  FireDAC.Dapt,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, Aurelius.Sql.MySQL,
  Aurelius.Schema.MySQL, Aurelius.Comp.Connection, Data.DB, FireDAC.Comp.Client,
  Aurelius.Engine.ObjectManager;

type
  TFireDacMySqlConnection = class(TDataModule)
    Connection: TFDConnection;
    AureliusConnection1: TAureliusConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private

      FConnection : IDBConnection;
      Manager : TObjectManager;

  public
    class function CreateConnection: IDBConnection;
    class function CreateFactory: IDBConnectionFactory;

  end;

var
  FireDacMySqlConnection: TFireDacMySqlConnection;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses 
  Aurelius.Drivers.Base;

{$R *.dfm}

{ TMyConnectionModule }

class function TFireDacMySqlConnection.CreateConnection: IDBConnection;
begin
  Result := FireDacMySqlConnection.AureliusConnection1.CreateConnection; 
end;

class function TFireDacMySqlConnection.CreateFactory: IDBConnectionFactory;
begin
  Result := TDBConnectionFactory.Create(
    function: IDBConnection
    begin
      Result := CreateConnection;
    end
  );
end;



procedure TFireDacMySqlConnection.DataModuleCreate(Sender: TObject);
begin
   FConnection := CreateConnection;
   FireDacMySqlConnection.Update(FConnection);
   Manager := TObjectManager.Create(FConnection);
end;

procedure TFireDacMySqlConnection.DataModuleDestroy(Sender: TObject);
begin
   Manager.Free;
end;

end.
