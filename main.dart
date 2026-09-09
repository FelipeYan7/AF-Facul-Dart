// AF 1 425.25-04AN - PROGRAMAÇÃO DE DISPOSITIVOS MÓVEIS
// SkyHorizon Airlines - Sistema de emissão de passagens
// Felipe Yan Cirino Gutierrez

class Passageiro {
  String? nome;
  String? cpf;
  String? rg;
  String? email;
  String? celular;
}

class PlataformaVenda {
  int? codigoCanal;
  String? nomeCanal;
}

class Atendente {
  String? nome;
  String? matricula;
  String? cargo;
  String? email;
  String? celular;
  double? salario;
}

class Passagem {
  String? _codigoLocalizador = '';
  Passageiro? passageiro;
  PlataformaVenda? plataforma;
  Atendente? atendente;
  String? observacoes;

  Passagem();

  Passagem.somenteCodigo(String codigoLocalizador) {
    _codigoLocalizador = codigoLocalizador;
  }

  Passagem.completa(this._codigoLocalizador, this.passageiro, this.plataforma,
      this.atendente, this.observacoes);

  Passagem.codigoEPassageiro({String? codigoLocalizador, this.passageiro}) {
    _codigoLocalizador = codigoLocalizador;
  }

  Passagem.all(String? codigoLocalizador,
      {required this.passageiro,
      required this.plataforma,
      required this.atendente,
      this.observacoes}) {
    _codigoLocalizador = codigoLocalizador;
  }

  String? getCodigoLocalizador() {
    return _codigoLocalizador;
  }

  void setCodigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print('Código localizador de passagem inválido!');
      return;
    }
    _codigoLocalizador = codigoLocalizador;
  }

  String? get codigoLocalizador => _codigoLocalizador;

  set codigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print('Código localizador de passagem inválido!');
      return;
    }
    _codigoLocalizador = codigoLocalizador;
  }

  void EmitirPassagem() {
    print('Passagem emitida com sucesso!');
  }

  bool CancelarPassagem() {
    print('Passagem cancelada com sucesso!');
    return true;
  }

  void AtualizarPassagem() {
    print('Passagem atualizada com sucesso!');
  }

  Passagem ConsultarPassagem(String codigo) {
    print('Passagem consultada com sucesso!');
    return Passagem();
  }
}

mixin Logger {
  void log(String mensagem) {
    print(mensagem);
  }
}

mixin Auditoria {
  void auditar(String mensagem) {
    print('[Auditoria]: $mensagem');
  }
}

class PassagemPrimeiraClasse extends Passagem with Logger, Auditoria {
  String? loungeAcesso;

  PassagemPrimeiraClasse(String? codigoLocalizador,
      {Passageiro? passageiro,
      PlataformaVenda? plataforma,
      Atendente? atendente,
      String? observacoes,
      required this.loungeAcesso})
      : super.all(codigoLocalizador,
            passageiro: passageiro,
            plataforma: plataforma,
            atendente: atendente,
            observacoes: observacoes);

  @override
  void AtualizarPassagem() {
    print('Passagem de Primeira Classe atualizada com sucesso!');
    log('Alteração feita pelo atendente: ${super.atendente?.nome}');
    auditar('verificação de segurança realizada para a Primeira Classe');
  }
}

void main() {
  Passageiro passageiro1 = Passageiro();
  passageiro1.nome = 'Carlo Job';
  passageiro1.cpf = '123.456.789-00';
  passageiro1.rg = '12.345.678-9';
  passageiro1.email = 'jobcarla@email.com';
  passageiro1.celular = '(11) 98888-7777';

  PlataformaVenda plataforma1 = PlataformaVenda();
  plataforma1.codigoCanal = 1;
  plataforma1.nomeCanal = 'Site Oficial';

  Atendente atendente1 = Atendente();
  atendente1.nome = 'Renato Truta';
  atendente1.matricula = 'A001';
  atendente1.cargo = 'Atendente de Balcão Supremo';
  atendente1.email = 'renatotruta@skyhorizon.com';
  atendente1.celular = '(11) 97777-6666';
  atendente1.salario = 3200.00;

  Passagem passagem1 = Passagem.completa(
      'SKH1001', passageiro1, plataforma1, atendente1, 'Sem restrições');

  print('--- Passagem padrão ---');
  print('Código: ${passagem1.getCodigoLocalizador()}');
  passagem1.EmitirPassagem();
  passagem1.AtualizarPassagem();
  passagem1.setCodigoLocalizador('');
  passagem1.codigoLocalizador = 'SKH1001-A';
  print('Novo código: ${passagem1.codigoLocalizador}');

  Passageiro passageiro2 = Passageiro();
  passageiro2.nome = 'Silvio Santos';
  passageiro2.cpf = '987.654.321-00';

  PlataformaVenda plataforma2 = PlataformaVenda();
  plataforma2.codigoCanal = 2;
  plataforma2.nomeCanal = 'Agência Válida';

  Atendente atendente2 = Atendente();
  atendente2.nome = 'Cristiano Ronaldo';
  atendente2.matricula = 'A002';

  Passagem passagem2 = Passagem.all('SKH2002',
      passageiro: passageiro2,
      plataforma: plataforma2,
      atendente: atendente2,
      observacoes: 'Bagagem extra');

  print('\n--- Passagem via construtor all() ---');
  print('Código: ${passagem2.codigoLocalizador}');
  print('Passageiro: ${passagem2.passageiro?.nome}');
  passagem2.EmitirPassagem();
  bool cancelada = passagem2.CancelarPassagem();
  print('Cancelada? $cancelada');

  Passageiro passageiro3 = Passageiro();
  passageiro3.nome = 'Felipe Yan';
  passageiro3.cpf = '111.222.333-44';

  PlataformaVenda plataforma3 = PlataformaVenda();
  plataforma3.codigoCanal = 3;
  plataforma3.nomeCanal = 'Balcão do Aeroporto';

  Atendente atendente3 = Atendente();
  atendente3.nome = 'Neymar';
  atendente3.matricula = 'A003';

  PassagemPrimeiraClasse passagemVip = PassagemPrimeiraClasse('SKH3003',
      passageiro: passageiro3,
      plataforma: plataforma3,
      atendente: atendente3,
      observacoes: 'Passageiro VIP',
      loungeAcesso: 'Sala Diamante');

  print('\n--- Passagem Primeira Classe ---');
  print('Código: ${passagemVip.codigoLocalizador}');
  print('Lounge: ${passagemVip.loungeAcesso}');
  passagemVip.EmitirPassagem();
  passagemVip.AtualizarPassagem();
}