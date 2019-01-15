(*
 *  This file is part of the gym-http-api OCaml binding project.
 *
 * Copyright 2016-2017 IBM Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *)

open Json_t

(** Json utilities. *)

val read_json_file : (Yojson.lexer_state -> Lexing.lexbuf -> 'a) -> string -> 'a
(**
   [read_json_file reader fname] reads the file [fname] using the
   reader [reader] generated by atdgen.
*)

(** {3 Builders} *)

val null : json
(** The [null] value of JSON. *)

val int : int -> json
(** [int n] build the value of JSON [n]. *)

val bool : bool -> json
(** [bool b] build the value of JSON [b]. *)

val string : string -> json
(** [string s] build the value of JSON [s]. *)

val assoc : (string * json) list -> json
(** [assoc o] build the JSON object [o]. *)

val list : json list -> json
(** [list l] build the JSON list [l]. *)


(** {3 Manipulation functions} *)

val set : json -> string -> json -> json
(**
   [set o x v] add (or replace) the a field [x] of the object [o] with
   value [v].
*)

val get : json -> string -> json option
(**
   [get o x] gets the value of the field [x] of the object [o].
*)

val take : json -> string -> json * json option
(**
   [take o x] gets the value of the field [x] of the object [o] and
   remove the field from the object. The left part of the return value
   is the modified object and the right part is the value of the
   field.
*)

val assign : json list -> json
(**
   [assign [o1; ...; on]] create a json object that contains all the
   fields of the objets [o1], ..., [on]. It is similare the the JavaScript
   function [Object.assing({}, o1, ... on)].
*)


val push : json -> string -> json -> json
(**
   [push o x v] add the value [v] in the list stored in a field [x]
   of the object [o]. It the field [x] doesn't exists, it creates it.
*)

val pop : json -> string -> json * json option
(**
   [pop o x] take a value in a list stored in the field [x] of [o].
*)


(** {3 Setters and getters} *)

(** {4 Boolean fields} *)

val set_bool : json -> string -> bool -> json
(**
   [set_bool o x b] sets the a field [x] of the object [o] with value
   [b].
*)

val get_bool : json -> string -> bool option
(**
   [get_bool o x] gets the value of the field [x] of the object [o].
*)

(** {4 String fields} *)

val set_string : json -> string -> string -> json
(**
   [set_string o x x] sets the a field [x] of the object [o] with string
   [s].
*)

val get_string : json -> string -> string option
(**
   [get_string o x] gets the value of the field [x] of the object [o].
*)

val take_string : json -> string -> json * string option
(**
   [take_string o x] takes the value of the field [x] of the object [o].
*)
