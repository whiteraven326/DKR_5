program n1;
type
  arr = array[1..100] of Integer;
var
  f1, f2: text; 
  i, n: Integer;
  a: arr;
procedure sortselect(var a: arr; n: Integer; b: Boolean); 
var
  i, j, index, k: Integer;
begin
  for i := 1 to n - 1 do
  begin
    index := i;
    for j := i + 1 to n do
    begin
      if b then
      begin
        if a[j] < a[index] then
          index := j;
      end
      else
      begin
        if a[j] > a[index] then
          index := j;
      end;
    end;

    if index <> i then
    begin
      k := a[i];
      a[i] := a[index];
      a[index] := k;
    end;
  end;
end;
begin
  assign(f1, 'zzz.txt'); 
  reset(f1);
  readln(f1, n);

  for i := 1 to n do 
    read(f1, a[i]);

  close(f1);

  writeln('Выберите порядок сортировки:');
  writeln('1. По возрастанию');
  writeln('2. По убыванию');
  write('Введите номер: ');

  var choice: Integer;
  readln(choice);

  case choice of
    1: sortselect(a, n, True); // сортировка по возрастанию
    2: sortselect(a, n, False); // сортировка по убыванию
  else
    begin
      writeln('Некорректный выбор.');
      Halt;
    end;
  end;

  assign(f2, 'xxx.txt'); 
  rewrite(f2);

  for i := 1 to n do 
    write(f2, a[i], ' ');

  close(f2);
  
  writeln('Сортировка прошла успешно! Результат записан в файл xxx.txt!');
end.
