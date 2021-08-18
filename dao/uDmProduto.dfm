object DmProduto: TDmProduto
  OldCreateOrder = False
  Height = 349
  Width = 498
  object sqlPesquisar: TSQLDataSet
    CommandText = 'select codigo, nome, fornecedor from prod where(nome like :nome)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 48
    Top = 40
  end
  object sqlInserir: TSQLDataSet
    CommandText = 
      'insert into prod (codigo, nome, descricao, preco, estoque, forne' +
      'cedor)'#13#10'values (:codigo, :nome, :descricao, :preco, :estoque, :f' +
      'ornecedor)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'descricao'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'preco'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'estoque'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'fornecedor'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 144
    Top = 40
  end
  object sqlAlterar: TSQLDataSet
    CommandText = 
      'update prod'#13#10'set nome = :nome,'#13#10'    descricao = :descricao,'#13#10'   ' +
      ' preco = :preco,'#13#10'    estoque = :estoque,'#13#10'    fornecedor = :for' +
      'necedor'#13#10'where (codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'descricao'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'preco'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'estoque'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'fornecedor'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 240
    Top = 40
  end
  object sqlExcluir: TSQLDataSet
    CommandText = 'delete from prod'#13#10'where (codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 336
    Top = 40
  end
  object dspPesquisar: TDataSetProvider
    DataSet = sqlPesquisar
    Left = 48
    Top = 136
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 48
    Top = 224
    object cdsPesquisarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPesquisarNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 255
    end
    object cdsPesquisarFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Required = True
      Size = 255
    end
  end
end
