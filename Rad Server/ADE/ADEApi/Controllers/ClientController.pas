unit ClientController;

// EMS Resource Module

interface

uses
  System.SysUtils,System.Classes,System.JSON,EMS.Services,
  EMS.ResourceAPI,EMS.ResourceTypes,rest.json;
type
 [ResourceName('client')]
  {$METHODINFO ON}
  TClientController = class
  published

 //   [ResourceSuffix('/getclientbyid/{id}')]
//    procedure GetClientById(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

 //   [ResourceSuffix('/getclients')]
//    [EndPointRequestSummary('User Management', '', 'Get all users from user table mysql database ', 'application/json', '')]
//    procedure GetClients(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);


//    [EndPointRequestSummary('User Management', '', 'Insert new user into user table mysql database ', 'application/json', '')]
 //   [EndPointRequestSummary('User Management', '', 'Get user by id from user table mysql database ', 'application/json', '')]
 //   [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'Id', '', true, TAPIDoc.TPrimitiveType.spInteger,
 //   TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spInteger, '', '')]
//    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spObject, TAPIDoc.TPrimitiveFormat.None, '', '')]

    [ResourceSuffix('/getclients')]
    procedure AddClient(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);


  {$METHODINFO OFF}
 
  end;
implementation
uses Client,ClientService;

//procedure TClientController.GetClients(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
//var
  //clients : TList<TClient>;
//begin
  //clients:= TUserDataAccess.GetUsers();
  //AResponse.Body.SetValue( TJSON.ObjectToJsonObject(clients), True);
//end;


//procedure TClientController.GetClientById(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
//var
  //id:string;
  //client:TClient;
//begin
 // id  := ARequest.Params.Values['id'];
//  client := TUserDataAccess.GetUserById(StrToInt(id));
 // AResponse.Body.SetValue( TJSON.ObjectToJsonObject(client), True);
//end;

procedure TClientController.AddClient(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  jsUser : TJSONObject;
begin
  jsUser := ARequest.Body.GetObject;
  TClientService.Create().AddClient(jsUser);
   //TUserDataAccess.Insert(client);
end;


procedure Register;
begin
  RegisterResource(TypeInfo(TClientController));
end;

initialization
  Register;
end.


