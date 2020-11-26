object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'WMDA Export Xml to Csv Converter'
  ClientHeight = 336
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblInstructions: TLabel
    Left = 312
    Top = 255
    Width = 391
    Height = 52
    Caption = 
      'You should use Python version 3.9 x64 bit'#13#10'more information on t' +
      'he web page https://www.python.org/downloads/windows/'#13#10'use the l' +
      'ink: "Windows x86-64 executable installer"'#13#10'the Path should be e' +
      '.g. SomeDisk:\Python39'
  end
  object btnStart: TButton
    Left = 8
    Top = 272
    Width = 129
    Height = 25
    Caption = 'Open And Convert'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object Log: TMemo
    Left = 8
    Top = 8
    Width = 766
    Height = 241
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object pbProgress: TcxProgressBar
    Left = 8
    Top = 312
    TabOrder = 2
    Width = 766
  end
end
