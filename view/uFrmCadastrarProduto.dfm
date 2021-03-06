object frmCadastrarProduto: TfrmCadastrarProduto
  Left = 0
  Top = 0
  Caption = 'Cadastrar Produto'
  ClientHeight = 463
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  OnDestroy = FormDestry
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 422
    Width = 714
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
  end
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 714
    Height = 422
    ActivePage = tbPesq
    Align = alClient
    TabOrder = 0
    object tbPesq: TTabSheet
      Caption = 'tbPesq'
      object pnlFiltro: TPanel
        Left = 0
        Top = 0
        Width = 706
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Color = clActiveBorder
        ParentBackground = False
        TabOrder = 0
        object editPesquisar: TLabeledEdit
          Left = 24
          Top = 16
          Width = 265
          Height = 21
          EditLabel.Width = 100
          EditLabel.Height = 13
          EditLabel.Caption = 'digite para Pesquisar'
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 592
          Top = 13
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object pnlBtnsPesq: TPanel
        Left = 0
        Top = 353
        Width = 706
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clActiveBorder
        ParentBackground = False
        TabOrder = 1
        object btnNovo: TButton
          Left = 424
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnDetalhar: TButton
          Left = 520
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Detalhar'
          TabOrder = 1
          OnClick = btnDetalharClick
        end
        object btnExcluir: TButton
          Left = 616
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 700
        Height = 306
        Align = alClient
        DataSource = dsPesq
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = FormDestry
      end
    end
    object tbDados: TTabSheet
      Caption = 'tbDados'
      ImageIndex = 1
      object edtNome: TLabeledEdit
        Left = 16
        Top = 80
        Width = 401
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 25
        TabOrder = 0
      end
      object edtDescrição: TLabeledEdit
        Left = 16
        Top = 128
        Width = 401
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 25
        TabOrder = 1
      end
      object edtPreço: TLabeledEdit
        Left = 88
        Top = 176
        Width = 49
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Pre'#231'o'
        TabOrder = 2
      end
      object edtEstoque: TLabeledEdit
        Left = 16
        Top = 176
        Width = 49
        Height = 21
        EditLabel.Width = 39
        EditLabel.Height = 13
        EditLabel.Caption = 'Estoque'
        TabOrder = 3
      end
      object edtFornecedor: TLabeledEdit
        Left = 176
        Top = 176
        Width = 241
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Fornecedor'
        MaxLength = 25
        TabOrder = 4
      end
      object pnlBtnsCad: TPanel
        Left = 0
        Top = 353
        Width = 706
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clBtnShadow
        ParentBackground = False
        TabOrder = 5
        object btnListar: TButton
          Left = 328
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Listar'
          TabOrder = 3
          OnClick = btnListarClick
        end
        object btnAlterar: TButton
          Left = 422
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 0
          OnClick = btnAlterarClick
        end
        object btnGravar: TButton
          Left = 519
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 1
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 608
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 2
          OnClick = btnCancelarClick
        end
      end
      object edtCodigo: TLabeledEdit
        Left = 16
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo'
        Enabled = False
        TabOrder = 6
      end
    end
  end
  object dsPesq: TDataSource
    DataSet = DmProduto.cdsPesquisar
    Left = 532
    Top = 96
  end
end
