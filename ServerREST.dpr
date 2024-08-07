program ServerREST;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  controller.pessoa in 'src\controller.pessoa.pas',
  interfaces.pessoa in 'src\interfaces.pessoa.pas',
  model.connection in 'src\model.connection.pas',
  model.pessoa in 'src\model.pessoa.pas';

begin
  THorse.Use(Jhonson());
  controller.pessoa.Registry;
  THorse.Listen(9000,
                procedure
                begin
                  Writeln('Servi�o executando na porta ' + THorse.Port.ToString);
                  Writeln('');
                  Write('Pressione Enter para parar');
                  Readln;
                  THorse.StopListen;
                end);
end.
