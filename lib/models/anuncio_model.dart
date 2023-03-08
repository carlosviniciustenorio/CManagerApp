class Anuncio {
  String? id;
  String? placa;
  Modelo? modelo;
  List<TiposCombustiveis>? tiposCombustiveis;
  int? portas;
  int? cambio;
  int? cor;
  List<Opcionais>? opcionais;
  List<Caracteristicas>? caracteristicas;
  String? km;
  String? estado;
  double? preco;
  String? usuarioId;
  bool? exibirTelefone;
  bool? exibirEmail;

  Anuncio(
      {this.id,
      this.placa,
      this.modelo,
      this.tiposCombustiveis,
      this.portas,
      this.cambio,
      this.cor,
      this.opcionais,
      this.caracteristicas,
      this.km,
      this.estado,
      this.preco,
      this.usuarioId,
      this.exibirTelefone,
      this.exibirEmail});

  Anuncio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placa = json['placa'];
    modelo =
        json['modelo'] != null ? new Modelo.fromJson(json['modelo']) : null;
    if (json['tiposCombustiveis'] != null) {
      tiposCombustiveis = <TiposCombustiveis>[];
      json['tiposCombustiveis'].forEach((v) {
        tiposCombustiveis!.add(new TiposCombustiveis.fromJson(v));
      });
    }
    portas = json['portas'];
    cambio = json['cambio'];
    cor = json['cor'];
    if (json['opcionais'] != null) {
      opcionais = <Opcionais>[];
      json['opcionais'].forEach((v) {
        opcionais!.add(new Opcionais.fromJson(v));
      });
    }
    if (json['caracteristicas'] != null) {
      caracteristicas = <Caracteristicas>[];
      json['caracteristicas'].forEach((v) {
        caracteristicas!.add(new Caracteristicas.fromJson(v));
      });
    }
    km = json['km'];
    estado = json['estado'];
    preco = json['preco'];
    usuarioId = json['usuarioId'];
    exibirTelefone = json['exibirTelefone'];
    exibirEmail = json['exibirEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['placa'] = this.placa;
    if (this.modelo != null) {
      data['modelo'] = this.modelo!.toJson();
    }
    if (this.tiposCombustiveis != null) {
      data['tiposCombustiveis'] =
          this.tiposCombustiveis!.map((v) => v.toJson()).toList();
    }
    data['portas'] = this.portas;
    data['cambio'] = this.cambio;
    data['cor'] = this.cor;
    if (this.opcionais != null) {
      data['opcionais'] = this.opcionais!.map((v) => v.toJson()).toList();
    }
    if (this.caracteristicas != null) {
      data['caracteristicas'] =
          this.caracteristicas!.map((v) => v.toJson()).toList();
    }
    data['km'] = this.km;
    data['estado'] = this.estado;
    data['preco'] = this.preco;
    data['usuarioId'] = this.usuarioId;
    data['exibirTelefone'] = this.exibirTelefone;
    data['exibirEmail'] = this.exibirEmail;
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

class TiposCombustiveis {
  int? id;
  String? descricao;

  TiposCombustiveis({this.id, this.descricao});

  TiposCombustiveis.fromJson(Map<String, dynamic> json) {
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

class Opcionais {
  int? id;
  String? descricao;

  Opcionais({this.id, this.descricao});

  Opcionais.fromJson(Map<String, dynamic> json) {
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

class Caracteristicas {
  int? id;
  String? descricao;

  Caracteristicas({this.id, this.descricao});

  Caracteristicas.fromJson(Map<String, dynamic> json) {
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
