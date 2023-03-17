class Anuncios {
  String? id;
  Modelo? modelo;
  int? cambio;
  int? cor;
  String? km;
  String? estado;
  double? preco;
  String? usuarioId;
  bool? exibirTelefone;
  bool? exibirEmail;
  Imagem? imagem;

  Anuncios(
      {this.id,
      this.modelo,
      this.cambio,
      this.cor,
      this.km,
      this.estado,
      this.preco,
      this.usuarioId,
      this.exibirTelefone,
      this.exibirEmail,
      this.imagem});

  Anuncios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelo =
        json['modelo'] != null ? new Modelo.fromJson(json['modelo']) : null;
    cambio = json['cambio'];
    cor = json['cor'];
    km = json['km'];
    estado = json['estado'];
    preco = json['preco'];
    usuarioId = json['usuarioId'];
    exibirTelefone = json['exibirTelefone'];
    exibirEmail = json['exibirEmail'];
    imagem =
        json['imagem'] != null ? new Imagem.fromJson(json['imagem']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.modelo != null) {
      data['modelo'] = this.modelo!.toJson();
    }
    data['cambio'] = this.cambio;
    data['cor'] = this.cor;
    data['km'] = this.km;
    data['estado'] = this.estado;
    data['preco'] = this.preco;
    data['usuarioId'] = this.usuarioId;
    data['exibirTelefone'] = this.exibirTelefone;
    data['exibirEmail'] = this.exibirEmail;
    if (this.imagem != null) {
      data['imagem'] = this.imagem!.toJson();
    }
    return data;
  }
}

class Modelo {
  int? id;
  String? descricao;
  int? anoModelo;
  int? anoFabricacao;
  Marca? marca;
  Versao? versao;

  Modelo(
      {this.id,
      this.descricao,
      this.anoModelo,
      this.anoFabricacao,
      this.marca,
      this.versao});

  Modelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    anoModelo = json['anoModelo'];
    anoFabricacao = json['anoFabricacao'];
    marca = json['marca'] != null ? new Marca.fromJson(json['marca']) : null;
    versao =
        json['versao'] != null ? new Versao.fromJson(json['versao']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['anoModelo'] = this.anoModelo;
    data['anoFabricacao'] = this.anoFabricacao;
    if (this.marca != null) {
      data['marca'] = this.marca!.toJson();
    }
    if (this.versao != null) {
      data['versao'] = this.versao!.toJson();
    }
    return data;
  }
}

class Marca {
  int? id;
  String? descricao;

  Marca({this.id, this.descricao});

  Marca.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    return data;
  }
}

class Versao {
  int? id;
  String? descricao;

  Versao({this.id, this.descricao});

  Versao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    return data;
  }
}

class Imagem {
  String? arn;

  Imagem({this.arn});

  Imagem.fromJson(Map<String, dynamic> json) {
    arn = json['arn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arn'] = this.arn;
    return data;
  }
}
