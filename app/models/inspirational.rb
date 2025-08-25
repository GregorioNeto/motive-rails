# frozen_string_literal: true

class Inspirational
  OPENERS  = [ "Acredite", "Confie", "Lembre-se", "Permita-se", "Escolha", "Decida", "Persista", "Comece", "Siga", "Valorize" ]
  SUBJECTS = [ "em você", "no seu potencial", "na jornada", "no processo", "em cada passo", "no hoje", "na sua força", "nos seus sonhos", "no que te move", "na mudança" ]
  VERBS    = [ "e siga em frente", "e faça acontecer", "e dê o primeiro passo", "e mantenha o foco", "e ajuste a rota", "e comemore pequenas vitórias", "e abrace os desafios", "e aprenda com os erros", "e saia da zona de conforto", "e confie no tempo" ]
  CLOSERS  = [ "todos os dias.", "agora.", "com coragem.", "com propósito.", "com constância.", "sem medo.", "com gratidão.", "com leveza.", "um passo de cada vez.", "no seu ritmo." ]

  def self.build
    "#{OPENERS.sample} #{SUBJECTS.sample} #{VERBS.sample} #{CLOSERS.sample}"
  end
end
