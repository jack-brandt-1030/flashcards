program ReviewProject;

{$R *.dres}

uses
  Vcl.Forms,
  Review in 'Review.pas' {ReviewForm},
  Learn in 'Learn.pas' {LearnForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TReviewForm, ReviewForm);
  Application.Run;
end.
