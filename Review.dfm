object ReviewForm: TReviewForm
  Left = 0
  Top = 0
  Caption = 'Review'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = Menu
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object PanelA: TPanel
    Left = 0
    Top = 141
    Width = 624
    Height = 75
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object BtnA: TSpeedButton
      Left = 0
      Top = 0
      Width = 624
      Height = 75
      Align = alClient
      Flat = True
      OnClick = BtnClick
      ExplicitLeft = 304
      ExplicitTop = 24
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
  end
  object PanelB: TPanel
    Left = 0
    Top = 216
    Width = 624
    Height = 75
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object BtnB: TSpeedButton
      Left = 0
      Top = 0
      Width = 624
      Height = 75
      Align = alClient
      Flat = True
      OnClick = BtnClick
      ExplicitLeft = 304
      ExplicitTop = 24
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
  end
  object PanelC: TPanel
    Left = 0
    Top = 291
    Width = 624
    Height = 75
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    object BtnC: TSpeedButton
      Left = 0
      Top = 0
      Width = 624
      Height = 75
      Align = alClient
      Flat = True
      OnClick = BtnClick
      ExplicitLeft = 304
      ExplicitTop = 24
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
  end
  object PanelD: TPanel
    Left = 0
    Top = 366
    Width = 624
    Height = 75
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    object BtnD: TSpeedButton
      Left = 0
      Top = 0
      Width = 624
      Height = 75
      Align = alClient
      Flat = True
      OnClick = BtnClick
      ExplicitLeft = 304
      ExplicitTop = 24
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
  end
  object InfoPanel: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    Caption = 
      'Review CS terms! Pick an answer from below. If wrong, the button' +
      ' will disappear.'
    TabOrder = 4
  end
  object MainPanel: TPanel
    Left = 0
    Top = 30
    Width = 624
    Height = 111
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 5
  end
  object Menu: TMainMenu
    Left = 304
    Top = 224
    object OptionsItem: TMenuItem
      Caption = 'Options'
      object LearnItem: TMenuItem
        Caption = 'Learn'
        OnClick = LearnItemClick
      end
    end
  end
end
