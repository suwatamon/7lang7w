-module(count_word).
-export([countw/1]).

countw([]) -> 0;
countw([32|Tail]) -> countw(Tail);
countw(String) -> 1 + countw(dropword(String)).

dropword([]) -> [];
dropword([32|Tail]) -> [32|Tail];
dropword([_|Tail]) -> dropword(Tail).
