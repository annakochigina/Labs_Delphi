unit Unit3;

interface
uses Vcl.Graphics, System.SysUtils, Unit2, Vcl.Grids;
type mass = array [1..50,1..50] of integer; //������ ���������
     TGraph = class
      private
        FCountVert : integer;
        FMatr : mass;
        FVertlist : array [1..50] of TVertex;
        FCanvas : TCanvas;
      public
        Constructor Create (Canv: TCanvas);
        procedure AddVertex (x, y : integer);
        procedure AddEdge (n1, n2 : integer);
        procedure DrawVertexs;
        //procedure DelVertex (n: integer);
        //procedure DelEdge (n1, n2 : integer);
        procedure DrawGraph;
        procedure DrawEdges;
        procedure DrawEdge(i, j : integer);
        procedure OutputMatr (Grid : TStringGrid);
        //procedure InputMatr (Grid : TStringGrid);
end;
implementation
  Constructor TGraph.Create;
  begin
    FCountVert := 0;
    FCanvas := Canv;
  end;

procedure TGraph.AddVertex(x, y : integer);
var i: Integer;
  begin
    inc(FCountVert);
    FVertlist[FCountVert] := TVertex.Create(x, y, FCountVert);
    for i := 1 to FCountVert do begin
      FMatr[i, FCountVert] := 0;
      FMatr[FCountVert, i] := 0;
    end;
  end;

procedure TGraph.OutputMatr(Grid: TStringGrid);
var i, j: Integer;
  begin
    Grid.ColCount := FCountVert+1;
    Grid.RowCount := FCountVert+1;
    for i := 1 to FCountVert do
      for j := 1 to FCountVert do
        Grid.Cells[j,i] := IntToStr(FMatr[i,j]);
    for i := 1 to FCountVert do
      Grid.Cells[0,i] := IntToStr(i);
    for i := 1 to FCountVert do
      Grid.Cells[i,0] := IntToStr(i);
  end;

  procedure TGraph.AddEdge(n1: Integer; n2: Integer);
  begin
     FMatr[n1,n2] := 1;
     FMatr[n2,n1] := 1;
  end;

  procedure TGraph.DrawVertexs;
  var i, j: Integer;
  begin
    for i := 1 to FCountVert do
      FVertlist[i].Draw(FCanvas);
  end;

  procedure TGraph.DrawEdge(i: integer; j : integer);
  var x1, y1, x2, y2 : integer;
  begin
    x1 := FVertList[i].x;
    y1 := FVertList[i].y;
    x2 := FVertList[j].x;
    y2 := FVertList[j].y;
    FCanvas.MoveTo(x1,y1);
    FCanvas.LineTo(x2,y2);
  end;

  procedure TGraph.DrawEdges;
  var i, j: Integer;
  begin
    for i := 1 to FCountVert do
      for j := 1 to i do
        if FMatr[i,j] = 1 then
          DrawEdge(i,j);
  end;

  procedure TGraph.DrawGraph;
  begin
    DrawEdges;
    DrawVertexs;
  end;

end.
