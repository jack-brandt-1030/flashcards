unit Review;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Menus;

type
  TReviewForm = class(TForm)
    PanelA: TPanel;
    PanelB: TPanel;
    PanelC: TPanel;
    PanelD: TPanel;
    InfoPanel: TPanel;
    MainPanel: TPanel;
    BtnB: TSpeedButton;
    BtnA: TSpeedButton;
    BtnC: TSpeedButton;
    BtnD: TSpeedButton;
    Menu: TMainMenu;
    OptionsItem: TMenuItem;
    LearnItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure LearnItemClick(Sender: TObject);
    procedure BtnClick(Sender: TObject);
  private
    FFrontWords: TArray<string>;
    FBackWords: TArray<string>;
    FPanels: TArray<TPanel>;
    FButtons: TArray<TSpeedButton>;
    FReviewedCount: Integer;
    FCorrect: Integer;
    FColors: TArray<Integer>;
    procedure Question;
    procedure SetCaption;
  end;

var
  ReviewForm: TReviewForm;

implementation

{$R *.dfm}

uses
  Generics.Collections, Learn;

const
  ButtonCount = 4;

procedure TReviewForm.Question;
var
  Panel: TPanel;
  Button: TSpeedButton;
  FrontIndex: Integer;
  Indices: TArray<Integer>;
  i: Integer;
  j: Integer;
  IndexSet: TDictionary<Integer, Integer>;
  Temp: Integer;
begin
  SetCaption;

  FrontIndex := Random(Length(FFrontWords));
  FCorrect := FrontIndex;
  Indices := [0, 0, 0, 0];
  i := Random(3);
  Indices[i] := FrontIndex;

  IndexSet := TDictionary<Integer, Integer>.Create;
  IndexSet.Add(FrontIndex, 0);

  for j := 0 to 2 do begin
    i := (i + 1) mod ButtonCount;

    Indices[i] := Random(Length(FFrontWords));
    while IndexSet.TryGetValue(Indices[i], Temp) do
      Indices[i] := Random(Length(FFrontWords));

    IndexSet.Add(Indices[i], 0);
  end;

  MainPanel.Caption := FFrontWords[FrontIndex];

  for i := 0 to ButtonCount - 1 do begin
    Panel := FPanels[i];
    Panel.Visible := True;
    Panel.Color := FColors[i];
    Button := FButtons[i];
    Button.Visible := True;
    Button.Enabled := True;
    Button.Caption := FBackWords[Indices[i]];
    Button.Tag := Indices[i];
  end;

  IndexSet.Free;
end;

procedure TReviewForm.FormCreate(Sender: TObject);
var
  Stream: TResourceStream;
  str: string;
  c: string;
  Letters: string;
  i: Integer;
  d, e: string;
  StringList: TStringList;
  StartedNew: Boolean;
begin
  Randomize;

  FReviewedCount := 0;

  SetCaption;

  FPanels := [PanelA, PanelB, PanelC, PanelD];
  FButtons := [BtnA, BtnB, BtnC, BtnD];

  FColors := [$FFEEDD, $EEFFDD, $EEDDFF, $FFDDEE];
  for i := 0 to ButtonCount - 1 do
    FPanels[i].Color := FColors[i];

  Stream := TResourceStream.Create(HInstance, 'Resource_1', RT_RCDATA);
  StringList := TStringList.Create;
  StringList.LoadFromStream(Stream);

  StartedNew := False;

  for str in StringList do begin
    if (Str = '') or (Str[1] = '*') then
      Continue;
    Letters := '';
    i := 0;
    while i <= Length(str) - 1 do begin
      c := str[i + 1];

      if (i = 0) or StartedNew then begin
        c := AnsiUpperCase(c);
        StartedNew := False;
      end;

      if i <= Length(str) - 3 then begin
        d := str[i + 2];
        e := str[i + 3];

        if (c = ' ') and (d = '-') and (e = ' ') then begin
          StartedNew := True;
          FFrontWords := FFrontWords + [Letters];
          Letters := '';
          i := i + 2;
        end else begin
          Letters := Letters + c;
        end;
      end else begin
        Letters := Letters + c;
      end;

      Inc(i);
    end;
    FBackWords := FBackWords + [Letters];
  end;

  Question;

  Stream.Free;
  StringList.Free;
end;

procedure TReviewForm.LearnItemClick(Sender: TObject);
begin
  TLearnForm.Execute(FFrontWords, FBackWords);
end;

procedure TReviewForm.BtnClick(Sender: TObject);
var
  Button: TSpeedButton;
  Panel: TPanel;
  i: Integer;
begin
  Button := Sender as TSpeedButton;
  Panel := Button.Parent as TPanel;
  if Button.Tag = FCorrect then begin
    for i := 0 to ButtonCount - 1 do begin
      FPanels[i].Color := clBtnFace;
      FButtons[i].Caption := '';
      FButtons[i].Enabled := False;
    end;
    MainPanel.Caption := 'Correct!';
    MainPanel.Refresh;
    Sleep(500);
    Inc(FReviewedCount);
    Question;
  end else begin
    Button.Enabled := False;
    Button.Caption := '';
    Panel.Color := clBtnFace;
  end;
end;

procedure TReviewForm.SetCaption;
begin
  InfoPanel.Caption := 'Review CS terms! Pick an answer from below. ' +
    'If wrong, the button will disappear. Total reviewed: ' +
    IntToStr(FReviewedCount);
end;

end.
