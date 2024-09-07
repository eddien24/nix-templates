{
  outputs = {self}: {
    templates.tex.path = ./tex;
    defaultTemplate = self.templates.tex;
  };
}
