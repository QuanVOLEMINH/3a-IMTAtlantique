
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | TIMES
    | PLUS
    | IDENT of (
# 5 "question1_1.mly"
       (string)
# 13 "question1_1.ml"
  )
    | EOF
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState8
  | MenhirState3
  | MenhirState0

# 1 "question1_1.mly"
  
  open Expr

# 40 "question1_1.ml"

let rec _menhir_goto_e : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_e -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv48 * _menhir_state * 'tv_e) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv42 * _menhir_state * 'tv_e) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv40 * _menhir_state * 'tv_e) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_e)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 7 "question1_1.mly"
      (Expr.expression)
# 60 "question1_1.ml"
        ) = 
# 10 "question1_1.mly"
           ( _1 )
# 64 "question1_1.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv38) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 7 "question1_1.mly"
      (Expr.expression)
# 72 "question1_1.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv36) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 7 "question1_1.mly"
      (Expr.expression)
# 80 "question1_1.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv34) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 7 "question1_1.mly"
      (Expr.expression)
# 88 "question1_1.ml"
        )) : (
# 7 "question1_1.mly"
      (Expr.expression)
# 92 "question1_1.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv35)) : 'freshtv37)) : 'freshtv39)) : 'freshtv41)) : 'freshtv43)
    | PLUS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv44 * _menhir_state * 'tv_e) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENT _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8) : 'freshtv45)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv46 * _menhir_state * 'tv_e) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv47)) : 'freshtv49)

and _menhir_run3 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_t -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_goto_t : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_t -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * 'tv_t) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack)
        | EOF | PLUS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv21 * _menhir_state * 'tv_t) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_t)) = _menhir_stack in
            let _v : 'tv_e = 
# 13 "question1_1.mly"
       ( _1 )
# 146 "question1_1.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv22)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv23 * _menhir_state * 'tv_t) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)) : 'freshtv26)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv31 * _menhir_state * 'tv_e)) * _menhir_state * 'tv_t) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | TIMES ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack)
        | EOF | PLUS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv27 * _menhir_state * 'tv_e)) * _menhir_state * 'tv_t) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_e)), _, (_3 : 'tv_t)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_e = 
# 12 "question1_1.mly"
              ( Plus (_1, _3) )
# 172 "question1_1.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv29 * _menhir_state * 'tv_e)) * _menhir_state * 'tv_t) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)) : 'freshtv32)
    | _ ->
        let (() : unit) = () in
        ((Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
        assert false) : 'freshtv33)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv15 * _menhir_state * 'tv_e)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv17 * _menhir_state * 'tv_t)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv20)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 5 "question1_1.mly"
       (string)
# 208 "question1_1.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 5 "question1_1.mly"
       (string)
# 218 "question1_1.ml"
    )) : (
# 5 "question1_1.mly"
       (string)
# 222 "question1_1.ml"
    )) = _v in
    ((let _v : 'tv_f = 
# 18 "question1_1.mly"
          ( Var _1 )
# 227 "question1_1.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_f) = _v in
    ((match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv5 * _menhir_state * 'tv_t)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_f) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv3 * _menhir_state * 'tv_t)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_f) : 'tv_f) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_t)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_t = 
# 15 "question1_1.mly"
               ( Times (_1, _3) )
# 248 "question1_1.ml"
         in
        _menhir_goto_t _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)) : 'freshtv6)
    | MenhirState8 | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_f) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_f) : 'tv_f) = _v in
        ((let _v : 'tv_t = 
# 16 "question1_1.mly"
       ( _1 )
# 263 "question1_1.ml"
         in
        _menhir_goto_t _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)) : 'freshtv10)) : 'freshtv12)) : 'freshtv14)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and expression : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 7 "question1_1.mly"
      (Expr.expression)
# 282 "question1_1.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 19 "question1_1.mly"
  

# 311 "question1_1.ml"

# 219 "/usr/share/menhir/standard.mly"
  


# 317 "question1_1.ml"
