{
  description = ''terminal tables'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."github-disruptek-nim-terminaltables-master".dir   = "master";
  inputs."github-disruptek-nim-terminaltables-master".owner = "nim-nix-pkgs";
  inputs."github-disruptek-nim-terminaltables-master".ref   = "master";
  inputs."github-disruptek-nim-terminaltables-master".repo  = "github-disruptek-nim-terminaltables";
  inputs."github-disruptek-nim-terminaltables-master".type  = "github";
  inputs."github-disruptek-nim-terminaltables-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."github-disruptek-nim-terminaltables-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}