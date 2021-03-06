# 4280-P3
Same as P2 with very  simple static semantics added

Based on this BNF:

<program>  ->     <vars> <block>
<block>       ->      Begin <vars> <stats> End
<vars>         ->      empty | INT Identifier Integer <vars> 
<expr>        ->      <A> + <expr> | <A> - <expr> | <A>
<A>             ->        <N> * <A> | <N>
<N>             ->       <M> / <N> | <M>
<M>              ->     - <M> |  <R>
<R>              ->      [ <expr> ] | Identifier | Integer
<stats>         ->      <stat> : <mStat>
<mStat>       ->      empty |  <stat>  :  <mStat>
<stat>           ->      <in> | <out> | <block> | <if> | <loop> | <assign>
<in>              ->      Read [ Identifier ]  
<out>            ->      Output [ <expr> ]
<if>               ->      IFF [ <expr> <RO> <expr> ] <stat>
<loop>          ->      Loop [ <expr> <RO> <expr> ] <stat>
<assign>       ->      Identifier  = <expr>  
<RO>            ->      < | = <  | >  | = > | =  =  |   =                    

Input file example:
INT X1 1
INT X2 2
Begin
  INT X3 3
  INT X2 4
  Read [ X1 ] :
  IFF [ X1 + 2 = = 3 ]
  Begin
    INT X2 5
    Loop [ 1 < 2 ]
      Output [ X1 + X2 ] :
  End :
  X1 = 1 + 2 :
  Output [ X2 ] :
End

The static semantics in this project looks for identifiers and whether they are undefined or are being redefined. It follows local
and global scoping similar to C, where:

int x;
int main() {
    int x;
    {
        int x;
    }
    
    return 0;
}

would not raise an error but:

int x;
int x;
int main() {
    return 0;
}

or 

int main() {
    int x;
    int x;
    return 0;
}

would raise an error. 
