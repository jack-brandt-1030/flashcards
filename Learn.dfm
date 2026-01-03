object LearnForm: TLearnForm
  Left = 0
  Top = 0
  Caption = 'Learn'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnResize = FormResize
  TextHeight = 15
  object Grid: TStringGrid
    Left = 0
    Top = 30
    Width = 624
    Height = 411
    Align = alClient
    ColCount = 2
    DefaultDrawing = False
    FixedRows = 0
    TabOrder = 0
    OnDrawCell = GridDrawCell
  end
  object UpperPanel: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Please read through the front and back pairs.'
    TabOrder = 1
  end
end
