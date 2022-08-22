program PR;

uses
  Vcl.Forms,
  Model.Conexao.SqlServer in 'Model\Conexao\Model.Conexao.SqlServer.pas',
  Model.DAO.Enderecos in 'Model\Dao\Model.DAO.Enderecos.pas',
  Model.DAO.Clientes in 'Model\Dao\Model.DAO.Clientes.pas',
  Model.Conexao.Interfaces in 'Model\Conexao\Model.Conexao.Interfaces.pas',
  Model.Conexao in 'Model\Conexao\Model.Conexao.pas',
  Model.Conexao.Zeos in 'Model\Conexao\Model.Conexao.Zeos.pas',
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  Controller.Controller in 'Controller\Controller.Controller.pas',
  View.Cliente in 'View\View.Cliente.pas' {FrmCadCliente},
  Model.Entidade.Enderecos in 'Model\Entidade\Model.Entidade.Enderecos.pas',
  Model.Entidade.Clientes in 'Model\Entidade\Model.Entidade.Clientes.pas',
  Model.Servico.Cep in 'Model\Servico\Model.Servico.Cep.pas',
  Controller.Servicos in 'Controller\Controller.Servicos.pas',
  Controller.Entidades in 'Controller\Controller.Entidades.pas',
  Model.DAO.Interfaces in 'Model\Dao\Model.DAO.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCadCliente, FrmCadCliente);
  Application.Run;
end.
