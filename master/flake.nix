{
  description = ''terminal tables'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-github-disruptek-nim-terminaltables-master.flake = false;
  inputs.src-github-disruptek-nim-terminaltables-master.ref   = "refs/heads/master";
  inputs.src-github-disruptek-nim-terminaltables-master.owner = "disruptek";
  inputs.src-github-disruptek-nim-terminaltables-master.repo  = "nim-terminaltables";
  inputs.src-github-disruptek-nim-terminaltables-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-github-disruptek-nim-terminaltables-master"];
    over = if builtins.pathExists ./override.nix 
           then { override = import ./override.nix; }
           else { };
  in lib.mkRefOutput (over // {
    inherit self nixpkgs ;
    src  = deps."src-github-disruptek-nim-terminaltables-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  } );
}