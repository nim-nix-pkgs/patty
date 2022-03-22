{
  description = ''Algebraic data types and pattern matching'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-patty-0_1_10.flake = false;
  inputs.src-patty-0_1_10.owner = "andreaferretti";
  inputs.src-patty-0_1_10.ref   = "0_1_10";
  inputs.src-patty-0_1_10.repo  = "patty";
  inputs.src-patty-0_1_10.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-patty-0_1_10"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-patty-0_1_10";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}