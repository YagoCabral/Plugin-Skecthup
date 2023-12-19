# meu_plugin.rb
module MeuPlugin
  extend self

  def criar_volumetria(tamanho_lote, altura)
    # Obtenha a referência ao modelo ativo e às entidades (o ambiente onde os objetos vivem)
    modelo = Sketchup.active_model
    entidades = modelo.active_entities
  
    # Crie um retângulo como base da volumetria
    face = entidades.add_face([0, 0, 0], [tamanho_lote, 0, 0], [tamanho_lote, tamanho_lote, 0], [0, tamanho_lote, 0])
  
    # Certifique-se de que o plano é válido antes de continuar
    if face.normal.valid?
      # Extruda a face para criar a volumetria tridimensional
      face.pushpull(altura)
      
      # Calcule o volume da volumetria
      volume = face.volume
      UI.messagebox("Volume da Volumetria: #{volume} unidades cúbicas.")
    else
      UI.messagebox('Erro: O plano não é válido para criar a volumetria.')
    end
  end
end