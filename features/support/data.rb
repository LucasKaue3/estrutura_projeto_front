module DataLoad
  def buscar_massa(tipo, dado)
    data = YAML.load_file("../qa-tc/features/support/data/hmg.yml")
    data[tipo.to_s][dado.to_s]
  end
end
