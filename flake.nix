{
  description = "Some of my flake templates";

  outputs = {self}: {
      templates = {
          tex = {
              path = ./tex;
              description = "A template with a shell hook for LaTeX work";
          };

          typst = {
              path = ./typst;
              description = "A template with a shell hook for Typst work";
          };
      };
  };
}
