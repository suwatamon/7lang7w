-module(count_word).
-export([countw/1]).

countw([]) -> 0;
countw([32|Tail]) -> countw(Tail);
countw(String) -> 1 + countw(lists:dropwhile(fun(C)->C/=32 end,  String)).

