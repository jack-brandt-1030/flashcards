unit Learn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  Vcl.ExtCtrls;

type
  TLearnForm = class(TForm)
    Grid: TStringGrid;
    UpperPanel: TPanel;
    procedure GridDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure FormResize(Sender: TObject);
  private
    function DoExecute(Front, Back: TArray<string>): Boolean;
  public
    class function Execute(Front, Back: TArray<string>): Boolean;
  end;

var
  LearnForm: TLearnForm;

implementation

{$R *.dfm}

class function TLearnForm.Execute(Front, Back: TArray<string>): Boolean;
var
  Frm: TLearnForm;
begin
  Frm := TLearnForm.Create(nil);
  try
    Result := Frm.DoExecute(Front, Back);
  finally
    Frm.Free;
  end;
end;

function TLearnForm.DoExecute(Front, Back: TArray<string>): Boolean;
var
  i: Integer;
begin
  Grid.Canvas.Font.Size := 12;

  Grid.RowCount := Length(Front);
  for i := 0 to Length(Front) - 1 do begin
    Grid.Cells[0, i] := Front[i];
    Grid.Cells[1, i] := Back[i];
  end;

  Grid.ColWidths[0] := (ClientWidth - Grid.GridLineWidth) div 2;
  Grid.ColWidths[1] := (ClientWidth - Grid.GridLineWidth) div 2;

  Result := ShowModal = mrOk;
end;

procedure TLearnForm.GridDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
var
  Text: string;
begin
  if gdSelected in State then begin
    Grid.Canvas.Brush.Color := clHighlight;
    Grid.Canvas.Font.Color := clHighlightText;
  end else begin
    Grid.Canvas.Brush.Color := Grid.Color;
    Grid.Canvas.Font.Color := Grid.Font.Color;
  end;

  Grid.Canvas.FillRect(Rect);

  Text := Grid.Cells[ACol, ARow];
  DrawText(
    Grid.Canvas.Handle,
    PChar(Text),
    -1,
    Rect,
    DT_WORDBREAK or DT_CALCRECT or DT_LEFT);
  if Grid.RowHeights[ARow] < (Rect.Bottom - Rect.Top) + 2 then
    Grid.RowHeights[ARow] := Rect.Bottom - Rect.Top + 2;
  DrawText(
    Grid.Canvas.Handle,
    PChar(Text),
    Length(Text),
    Rect,
    DT_WORDBREAK or DT_LEFT);
end;

procedure TLearnForm.FormResize(Sender: TObject);
begin
  Grid.ColWidths[0] := (ClientWidth - Grid.GridLineWidth) div 2;
  Grid.ColWidths[1] := (ClientWidth - Grid.GridLineWidth) div 2;
  Grid.Refresh;
end;

end.
