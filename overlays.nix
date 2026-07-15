{ inputs, ... }:

[
  (final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
    llm-agents = inputs.llm-agents.packages.${final.system};
  })
]
