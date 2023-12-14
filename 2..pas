program n2;
type
  arr = array[1..100] of integer;
var
  f1, f2: text; 
  i, n: integer;
  a: arr;

// Процедура пирамидной сортировки
procedure heapsort(var a: arr; n: integer; b: boolean); 
var
  i, j, index, k: integer;

  // Процедура перестроения пирамиды
  procedure heapify(var a: arr; n, i: integer; b: boolean);
  var
    largest, l, r: integer;
  begin
    largest := i;
    l := 2 * i;
    r := 2 * i + 1;
    
    if b then
    begin
      if (l <= n) and (a[l] > a[largest]) then
        largest := l;
      if (r <= n) and (a[r] > a[largest]) then
        largest := r;
    end
    else
    begin
      if (l <= n) and (a[l] < a[largest]) then
        largest := l;
      if (r <= n) and (a[r] < a[largest]) then
        largest := r;
    end;
    
    if largest <> i then
    begin
      k := a[i];
      a[i] := a[largest];
      a[largest] := k;
      heapify(a, n, largest, b);
    end;
  end;

begin
  // Построение пирамиды
  for i := n div 2 downto 1 do
    heapify(a, n, i, b);

  // Перестановка элементов для получения отсортированного массива
  for i := n downto 2 do
  begin
    k := a[1];
    a[1] := a[i];
    a[i] := k;
    heapify(a, i - 1, 1, b);
  end;
end;

begin
  assign(f1, 'aaa.txt'); 
  reset(f1);
  readln(f1, n);

  for i := 1 to n do 
    read(f1, a[i]);

  close(f1);

  writeln('выберите порядок сортировки:');
  writeln('1. по возрастанию');
  writeln('2. по убыванию');
  write('введите номер: ');

  var choice: integer;
  readln(choice);

  case choice of
    1: heapsort(a, n, true); // сортировка по возрастанию
    2: heapsort(a, n, false); // сортировка по убыванию
  else
    begin
      writeln('некорректный выбор.');
      halt;
    end;
  end;

  assign(f2, 'bbb.txt'); 
  rewrite(f2);

  for i := 1 to n do 
    write(f2, a[i], ' ');

  close(f2);
  
  writeln('сортировка прошла успешно! результат записан в файл bbb.txt!');
end.
